import 'dart:io';


import '../../backend/schema/enums/enums.dart';
import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../../analytics_service.dart';


final analytics_service = AnalyticsService();

final Logger _logger = Logger();


Future<Response?> retryRequest(
  Future<Response> Function() request, {
  int retries = 3,
  Duration delay = const Duration(seconds: 2),
}) async {
  int attempt = 0;
  Response? response;

  while (attempt < retries) {
    try {
      // Make the request
      response = await request();

      // Log success
      _logger.i('Request succeeded with status: ${response.statusCode}');

      // Check for successful status codes
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      }

      // Stop retrying for 400-level errors (client errors)
      if (response.statusCode >= 400 && response.statusCode < 500) {
        _logger.e(
            'Non-recoverable error: ${response.statusCode}. Stopping retries.');
        return response; // Return response for client error
      }

      // Log other status codes and continue retrying
      _logger.w(
          'Request failed with status: ${response.statusCode}. Retrying...');
    } on TimeoutException catch (e) {
      // Handle request timeout
      _logger.e('TimeoutException occurred: $e');
    } on SocketException catch (e) {
      // Handle network issues
      _logger.e('SocketException occurred: $e');
    } catch (e) {
      // Catch-all for other exceptions
      _logger.e('An unexpected error occurred: $e');
    }

    // Increment attempt counter
    attempt++;

    // If retries remain, wait before retrying
    if (attempt < retries) {
      await Future.delayed(delay);
    }
  }

  // Log and return the last response or null if all retries failed
  _logger.e('All retries failed. Returning the last response or null.');
  return response;
}


Future<void> sendNotificationForRentalStatus({
  required RentalStatus status,
  required String gameName,
  required DocumentReference gameRef,
  required DocumentReference rentingUserRef,
  required DocumentReference ownerRef,
}) async {
  NotificationTypes? notificationType;

  switch (status) {
    case RentalStatus.initiated:
      notificationType = NotificationTypes.PAYMENT_CREATED;
      break;
    case RentalStatus.rented:
      notificationType = NotificationTypes.GAME_RENTED;
      break;
    case RentalStatus.paid:
      notificationType = NotificationTypes.ORDER_PAID;
      break;
    case RentalStatus.deliveryRented:
      notificationType = NotificationTypes.DRIVER_GOING_OWNER;
      break;
    case RentalStatus.received:
      notificationType = NotificationTypes.ORDER_DELIVERED_RENTER;
      break;
    case RentalStatus.deliveryReturned:
      notificationType = NotificationTypes.DRIVER_GOING_RENTER;
      break;
    case RentalStatus.returned:
      notificationType = NotificationTypes.ORDER_DELIVERED_OWNER;
      break;
    case RentalStatus.timeAdded:
      notificationType = NotificationTypes.PAYMENT_UPDATED;
      break;
    case RentalStatus.cancelled:
      notificationType = NotificationTypes.ORDER_CANCELLED;
      break;
    case RentalStatus.denied:
      notificationType = NotificationTypes.ORDER_CANCELLED; 
      break;
    default:
      notificationType = NotificationTypes.GENERAL;
  }

  if (notificationType == null) return;

  final notificationPayload = {
    "title": "Status atualizado: $gameName",
    "message": "O status do aluguel foi alterado para $status.",
    "initial_page_name": "rentRequest",
    "parameter_data": {
      "gameRef": gameRef,
      "rentingUserRef": rentingUserRef,
    },
    "user_ids": [ownerRef],
    "type": notificationType.toString(),
  };

  try {
    final response = await retryRequest(
      () => post(
        Uri.parse('https://<YOUR_CLOUD_FUNCTION_URL>/create_notification'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(notificationPayload),
      ),
      retries: 3,
      delay: const Duration(seconds: 2),
    );

    if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
      logFirebaseEvent('notification_sent_successfully');
      _logger.i('Notification sent successfully. Response: ${response.body}');
    } else {
      logFirebaseEvent('notification_failed');
      _logger.w('Failed to send notification. Status: ${response?.statusCode}, Response: ${response?.body}');
    }
  } catch (e) {
    logFirebaseEvent('notification_exception');
    _logger.e('An error occurred while sending notification: $e');
  }
}
