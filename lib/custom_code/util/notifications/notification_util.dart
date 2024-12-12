import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../backend/schema/enums/enums.dart';

class NotificationService {
  static Future<void> sendNotificationForRentalStatus({
    required RentalStatus status,
    required String gameName,
    required DocumentReference gameRef,
    required DocumentReference rentingUserRef,
    required DocumentReference ownerRef,
  }) async {
    final notificationType = _getNotificationType(status);

    final notificationPayload = {
      "title": "Status atualizado: $gameName",
      "message": "O status do aluguel foi alterado para ${status.name}.",
      "initial_page_name": "rentRequest",
      "parameter_data": {
        "gameRef": gameRef.id,
        "rentingUserRef": rentingUserRef.id,
      },
      "user_ids": [ownerRef.id],
      "type": notificationType.toString(),
    };

    try {
      final response = await _retryRequest(
        () => http.post(
          Uri.parse('https://<YOUR_CLOUD_FUNCTION_URL>/create_notification'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(notificationPayload),
        ),
      );

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        debugPrint('Notification sent successfully.');
      } else {
        debugPrint('Failed to send notification: ${response?.body}');
      }
    } catch (e) {
      debugPrint('Notification error: $e');
    }
  }

  static NotificationTypes _getNotificationType(RentalStatus status) {
    switch (status) {
      case RentalStatus.initiated:
        return NotificationTypes.PAYMENT_CREATED;
      case RentalStatus.rented:
        return NotificationTypes.GAME_RENTED;
      case RentalStatus.paid:
        return NotificationTypes.ORDER_PAID;
      case RentalStatus.deliveryRented:
        return NotificationTypes.DRIVER_GOING_OWNER;
      case RentalStatus.received:
        return NotificationTypes.ORDER_DELIVERED_RENTER;
      case RentalStatus.deliveryReturned:
        return NotificationTypes.DRIVER_GOING_RENTER;
      case RentalStatus.returned:
        return NotificationTypes.ORDER_DELIVERED_OWNER;
      case RentalStatus.timeAdded:
        return NotificationTypes.PAYMENT_UPDATED;
      case RentalStatus.cancelled:
      case RentalStatus.denied:
        return NotificationTypes.ORDER_CANCELLED;
      default:
        return NotificationTypes.GENERAL;
    }
  }

  static Future<http.Response?> _retryRequest(
    Future<http.Response> Function() request, {
    int retries = 3,
    Duration delay = const Duration(seconds: 2),
  }) async {
    int attempt = 0;
    while (attempt < retries) {
      try {
        final response = await request();
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response;
        }
      } catch (e) {
        debugPrint('Attempt $attempt failed: $e');
      }
      attempt++;
      if (attempt < retries) {
        await Future.delayed(delay);
      }
    }
    return null;
  }
}
