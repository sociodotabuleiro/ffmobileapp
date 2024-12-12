import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '../../../auth/firebase_auth/auth_util.dart';
import '../../../flutter_flow/flutter_flow_util.dart';

class PaymentUtil {
  /// Opens dialog to choose payment method: Pix or Credit Card.
  static Future<bool> choosePaymentMethod({
    required BuildContext context,
    required Widget customContent, // Allows passing a widget
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Método de Pagamento'),
              content: customContent, // Custom content passed dynamically
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, false),
                  child: const Text('Pix'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: const Text('Cartão'),
                ),
              ],
            );
          },
        ) ??
        false; // Return false if null
  }

  /// Processes the payment request to the backend.
  static Future<bool> processPayment({
    required Map<String, dynamic> paymentData,
    required String billingType,
    required Function showLoadingDialog,
    required Function hideLoadingDialog,
    required Function onPixQrCode,
    required Function onPaymentLink,
    required Function onError,
  }) async {
    showLoadingDialog('Processando pagamento...');
    paymentData['billingType'] = billingType;

    try {
      final response = await retryRequest(
        () => http.post(
          Uri.parse('https://create-billing-667069547103.us-central1.run.app'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(paymentData),
        ),
        retries: 3,
        delay: const Duration(seconds: 2),
      );

      hideLoadingDialog();

      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        final responseData = jsonDecode(response.body);
        if (billingType == 'PIX' && responseData['paymentDetails']['qrCodeInfo'] != null) {
          onPixQrCode(responseData['paymentDetails']['qrCodeInfo']);
        } else if (billingType == 'CREDIT_CARD') {
          final paymentLink = responseData['paymentDetails']['paymentLink'];
          if (paymentLink != null) onPaymentLink(paymentLink);
        }
        return true;
      } else {
        onError('Erro ao iniciar pagamento!', response?.statusCode, response?.body);
        return false;
      }
    } catch (e) {
      hideLoadingDialog();
      onError('Erro ao iniciar pagamento!', null, e.toString());
      return false;
    }
  }

  /// Processes card payment with a prepared description.
  static Future<bool> processCardPayment({
    required DocumentReference rentalRef,
    required String description, // Dynamic description
    required Function showLoadingDialog,
    required Function hideLoadingDialog,
    required Function onPaymentLink,
    required Function onError,
  }) async {
    Map<String, dynamic> paymentData = _preparePaymentData(rentalRef, description);
    return await processPayment(
      paymentData: paymentData,
      billingType: 'CREDIT_CARD',
      showLoadingDialog: showLoadingDialog,
      hideLoadingDialog: hideLoadingDialog,
      onPixQrCode: (_) {},
      onPaymentLink: onPaymentLink,
      onError: onError,
    );
  }

  /// Processes Pix payment with a prepared description.
  static Future<bool> processPixPayment({
    required DocumentReference rentalRef,
    required String description, // Dynamic description
    required Function showLoadingDialog,
    required Function hideLoadingDialog,
    required Function onPixQrCode,
    required Function onError,
  }) async {
    Map<String, dynamic> paymentData = _preparePaymentData(rentalRef, description);
    return await processPayment(
      paymentData: paymentData,
      billingType: 'PIX',
      showLoadingDialog: showLoadingDialog,
      hideLoadingDialog: hideLoadingDialog,
      onPixQrCode: onPixQrCode,
      onPaymentLink: (_) {},
      onError: onError,
    );
  }

  /// Prepares the payment data with a custom description.
  static Map<String, dynamic> _preparePaymentData(DocumentReference rentalRef, String description) {
    return {
      'customer': currentUserDocument?.asaasClientId ?? '',
      'value': FFAppState().purchaseData.quantity.toDouble() +
          functions.getObjectForUserRef(
            FFAppState().quotations.toList(),
            FFAppState().ownerRefPurchase!,
          )!.priceBreakdown.total,
      'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),
      'description': description, 

      
      'externalReference': FFAppState().externalReference,
      'usersRentalRef': rentalRef.path,
    };
  }

  /// Retries an HTTP request a specific number of times.
  static Future<http.Response?> retryRequest(
    Future<http.Response> Function() request, {
    int retries = 3,
    Duration delay = const Duration(seconds: 2),
  }) async {
    for (int i = 0; i < retries; i++) {
      try {
        final response = await request();
        return response;
      } catch (_) {
        if (i == retries - 1) rethrow;
        await Future.delayed(delay);
      }
    }
    return null;
  }
}