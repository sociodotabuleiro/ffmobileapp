import 'dart:async';

import 'package:http/http.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '../../../analytics_service.dart';
import 'package:logger/logger.dart';
import '../network_util.dart' as network_util;

final analytics_service = AnalyticsService();
final Logger _logger = Logger();
final network_util.NetworkUtil _network_util = network_util.NetworkUtil();

class DeliveryUtil {
  Future<bool> callLalamove(
  String ownerName,
  String ownerPhoneNumber,
  String renterName,
  String renterPhoneNumber,
  String orderId,

  ) async {
    analytics_service.logFunnelStep('CALLING_LALAMOVE', 7);
    const int maxRetries = 3; 
    const Duration retryDelay = Duration(seconds: 2); 
    dynamic lalamoveCallRequest;
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        logFirebaseEvent('call_lalamove_api_attempt', parameters: {'attempt': attempt + 1});

        // Retrieve quotation data
        LalamoveQuotationDataStruct quotationData =
            functions.getObjectForUserRef(FFAppState().quotations.toList(), FFAppState().ownerRefPurchase!)!;

        // Call Lalamove API
          lalamoveCallRequest = await actions.callDriverLalamove(
          quotationData.stops.toList(),
          quotationData.quotationId,
          ownerName,
          ownerPhoneNumber,
          renterName,
          renterPhoneNumber,
          orderId,
        );

        // Check response status
        if (functions.checkStatusCode(lalamoveCallRequest!)) {
          logFirebaseEvent('lalamove_call_successful');
          LalamoveOrderResponseStruct response =
              LalamoveOrderResponseStruct.maybeFromMap(lalamoveCallRequest)!;

          FFAppState().addToLalamoveOrderResponses(response);

          return true; // Delivery setup succeeded
        } else {
          logFirebaseEvent('lalamove_call_failed');
          _logger.w('Lalamove call failed. Retrying...');
        }
      } catch (e) {
        logFirebaseEvent('lalamove_exception');
        _logger.e('An error occurred while calling Lalamove: $e');
      }

      attempt++;
      if (attempt < maxRetries) {
        await Future.delayed(retryDelay);
      }
    }

    // Optionally, roll back payment (implement rollback logic if needed)
    await rollbackPayment();

    return false; // Delivery setup failed
  }

   Future<void> rollbackPayment() async {
    logFirebaseEvent('rollback_payment');
    analytics_service.logFunnelStep('ROLLBACK_PAYMENT', 71);
    try {
      final response = await _network_util.retryRequest(
        () => post(
          Uri.parse('https://asaasrefundpayment-667069547103.southamerica-east1.run.app'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'paymentId': FFAppState().paymentId,
          }),
        ),
        retries: 3,
        delay: const Duration(seconds: 2),
      );

      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        final responseData = jsonDecode(response.body);
        if (responseData['success'] == true) {
          logFirebaseEvent('payment_rollback_success');
          _logger.i('Payment successfully rolled back. Refunds: ${responseData['refunds']}');
        } else {
          logFirebaseEvent('payment_rollback_failed', parameters: {'response': response.body});
          _logger.w('Failed to roll back payment. Response: ${response.body}');
        }
      } else {
        logFirebaseEvent('payment_rollback_failed', parameters: {
          'response': response?.body,
          'status': response?.statusCode,
          'paymentId': FFAppState().paymentId,
          'ownerRef': FFAppState().ownerRefPurchase,
          'rentingRef': currentUserReference});
        _logger.w('Failed to roll back payment. Status: ${response?.statusCode}, Response: ${response?.body}');
      }
    } catch (e) {
      logFirebaseEvent('payment_rollback_exception', parameters: {'error': e.toString(),
          'paymentId': FFAppState().paymentId,
          'ownerRef': FFAppState().ownerRefPurchase,
          'rentingRef': currentUserReference});
      _logger.e('An error occurred while rolling back payment: $e');
    }
  }

}