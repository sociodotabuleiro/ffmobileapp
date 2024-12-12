import 'dart:async';
import 'dart:io';

import 'package:sociodotabuleiro/custom_code/util/rents/rents_util.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'to_rent_list_model.dart';
export 'to_rent_list_model.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../../analytics_service.dart';
import '../../custom_code/util/network_util.dart';
import '../../custom_code/util/delivery/delivery_util.dart';


final analytics_service = AnalyticsService();
final Logger _logger = Logger();
final deliveryUtil = DeliveryUtil();


class ToRentListWidget extends StatefulWidget {
  /// This page should return all the users that are renting the game choosen in
  /// the last page, by distance. It should bring information about the game to
  /// be rented
  const ToRentListWidget({
    super.key,
    this.gameObject,
  });

  final GamesRecord? gameObject;

  @override
  State<ToRentListWidget> createState() => _ToRentListWidgetState();
}

class _ToRentListWidgetState extends State<ToRentListWidget> {
  late ToRentListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToRentListModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'toRentList'});

     analytics_service.logFunnelStep('VIEW_OWNERS_LIST', 2);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> showPixQrCodeDialog(BuildContext context, String encodedImage, String payload, DateTime expirationDate) async {
  Uint8List decodedImage = base64Decode(encodedImage); // Decode Base64 image

  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('Pagamento Pix'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.memory(decodedImage, height: 150, width: 150), // Display QR code image
            const SizedBox(height: 10),
            const Text('Pix "Copia e Cola":', style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(payload), // Display Pix payload for "Copia e Cola"
            const SizedBox(height: 10),
            Text('Válido até: ${DateFormat('yyyy-MM-dd HH:mm').format(expirationDate)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('Fechar'),
          ),
        ],
      );
    },
  );
}


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

  // Loading indicator dialog
  Future<void> showLoadingDialog(BuildContext context, String message) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              Expanded(child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  // Hide the loading dialog
  void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  // Centralized error dialog
  Future<void> showErrorDialog(BuildContext context, String title, int? statusCode, String? errorMessage) async {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text('Status: ${statusCode ?? 'unknown'}\nErro: ${errorMessage ?? 'unknown error'}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

//   Future<DocumentReference> createOrUpdateRentalsRecord({
//   required DocumentReference userRef,
//   required String rentalId,
//   required DateTime rentalDate,
//   required DateTime dueDate,
//   required double pricePerDay,
//   required RentalStatus status,
//   required DateTime currentStatusTime,
//   required bool isRenter,
//   DocumentReference? ownerID,
//   DocumentReference? renterID,
//   double? deliveryFee,
//   DateTime? firstDeliveryDate,
//   List<DocumentReference>? games,
// }) async {
//   logFirebaseEvent('create_or_update_rentals_record');
//
//   // Prepare the rentals record data
//   final rentalsRecordData = {
//     'rentalID': rentalId,
//     'rentalDate': rentalDate,
//     'dueDate': dueDate,
//     'pricePerDay': pricePerDay,
//     'status': status,
//     'currentStatusTime': currentStatusTime,
//     if (deliveryFee != null) 'deliveryFee': deliveryFee,
//     if (firstDeliveryDate != null) 'firstDeliveryDate': firstDeliveryDate,
//     if (ownerID != null) 'ownerID': ownerID,
//     if (renterID != null) 'renterID': renterID,
//     if (games != null) 'games': games,
//   };
//
//   final rentalRef = RentalsRecord.createDoc(userRef, id: rentalId);
//   await rentalRef.set(rentalsRecordData);
//
//   final rentalsRecord = RentalsRecord.getDocumentFromData(rentalsRecordData, rentalRef);
//
//   if (isRenter) {
//     _model.documentRenting = rentalsRecord;
//   } else {
//     _model.documentOwner = rentalsRecord;
//   }
//
//   return rentalRef;
// }

  // Future<void> updateUserReferences(
  //   RentalsRecord ownerRentalsRef,
  //   RentalsRecord renterRentalsRef,
  //   DocumentReference ownerRef,
  //   DocumentReference renterRef,
  // ) async {
  //       logFirebaseEvent('update_user_references');
//
  //       // Update current user's (renter's) document
  //       await renterRef.update({
  //         'rentedFromCount': FieldValue.increment(1),
  //         'rentedFrom': FieldValue.arrayUnion([ownerRef]),
  //         'rentedFromIds': FieldValue.arrayUnion([ownerRentalsRef]),
  //       });
//
  //       // Update owner's document
  //       await ownerRef.update({
  //         'rentedToCount': FieldValue.increment(1),
  //         'rentedTo': FieldValue.arrayUnion([renterRef]),
  //         'rentedToIds': FieldValue.arrayUnion([renterRentalsRef]),
  //       });
  //     }

  Future<bool> checkRenterSelection() async {
    logFirebaseEvent('get_renter_object');
    _model.renterObject = await UsersRecord.getDocumentOnce(FFAppState().ownerRefPurchase!);

    if (_model.renterObject?.reference != null) {
      return true;
    } else {
      logFirebaseEvent('no_renter_selected_dialog');
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: const Text('Sem escolha de usuário!'),
              content: const Text('Por favor escolha um locador e uma data!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      );
      return false;
    }
  }

  Future<bool> choosePaymentMethod() async {
    logFirebaseEvent('choose_payment_method_dialog');
    var confirmDialogResponse = await showDialog<bool>(
      context: context,
      builder: (alertDialogContext) {
        return WebViewAware(
          child: AlertDialog(
            title: const Text('Método de Pagamento'),
            content: const Text('Qual método de pagamento você deseja usar?'),
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
          ),
        );
      },
    ) ?? false;
    return confirmDialogResponse;
  }

  Future<bool> processPayment(Map<String, dynamic> paymentData, String billingType) async {
      showLoadingDialog(context, 'Processando pagamento...'); // Show loading indicator

      paymentData['billingType'] = billingType; // Set the billing type
      paymentData['externalReference'] = FFAppState().externalReference; // Set external reference for tracking

    try {
      final response = await retryRequest(
        () => post(
          Uri.parse('https://create-billing-667069547103.us-central1.run.app'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(paymentData),
        ),
        retries: 3,
        delay: const Duration(seconds: 2),
      );

      hideLoadingDialog(context); // Hide loading dialog once processing is complete

      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        final responseData = jsonDecode(response.body);
        logFirebaseEvent('payment_initiated_successfully');
        FFAppState().paymentId = responseData['id'];

        if (billingType == 'PIX' && responseData['paymentDetails']['qrCodeInfo'] != null) {
          // Display Pix QR code if available
          final qrCodeInfo = responseData['paymentDetails']['qrCodeInfo'];
          await showPixQrCodeDialog(
            context,
            qrCodeInfo['encodedImage'],
            qrCodeInfo['payload'],
            DateTime.parse(qrCodeInfo['expirationDate']),
          );
        } else if (billingType == 'CREDIT_CARD') {
          // If payment is via credit card, open payment link
          final paymentLink = responseData['paymentDetails']['paymentLink'];
          if (paymentLink != null) await launchURL(paymentLink);
        }
        return true;
      } else {
        logFirebaseEvent('payment_creation_failed');
        await showErrorDialog(context, 'Erro ao iniciar pagamento!', response?.statusCode, response?.body);
        return false;
      }
    } catch (e) {
      hideLoadingDialog(context);
      logFirebaseEvent('payment_exception');
      await showErrorDialog(context, 'Erro ao iniciar pagamento!', null, e.toString());
      return false;
    }
  }
  
  Future<bool> processCardPayment(DocumentReference rentalRef) async {
    logFirebaseEvent('payment_card_chosen');
    analytics_service.logFunnelStep('PAYING_CARD', 6);

    // Prepare payment data with usersRentalRef
    Map<String, dynamic> paymentData = {
      'customer': currentUserDocument?.asaasClientId ?? '',
      'value': FFAppState().purchaseData.quantity.toDouble() +
          functions.getObjectForUserRef(
            FFAppState().quotations.toList(),
            FFAppState().ownerRefPurchase!,
          )!.priceBreakdown.total,
      'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),
      'description': widget.gameObject?.name ?? '',
      'externalReference': FFAppState().externalReference,
      'usersRentalRef': rentalRef.path, // Pass the Firestore path of the rental document
    };

    return await processPayment(paymentData, 'CREDIT_CARD');
  }
  
  Future<bool> processPixPayment(DocumentReference rentalRef) async {
    logFirebaseEvent('payment_pix_chosen');
    analytics_service.logFunnelStep('PAYING_PIX', 6);
    // Prepare payment data with usersRentalRef
    Map<String, dynamic> paymentData = {
    'customer': currentUserDocument?.asaasClientId ?? '',
    'value': FFAppState().purchaseData.quantity.toDouble() +
        functions.getObjectForUserRef(
          FFAppState().quotations.toList(),
          FFAppState().ownerRefPurchase!,
        )!.priceBreakdown.total,
    'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),
    'description': widget.gameObject?.name ?? '',
    'externalReference': FFAppState().externalReference,
    'usersRentalRef': rentalRef.path, // Pass the Firestore path of the rental document
    };

    return await processPayment(paymentData, 'PIX');
  } 
  
//Future<void> rollbackPayment() async {
  //   logFirebaseEvent('rollback_payment');
  //   analytics_service.logFunnelStep('ROLLBACK_PAYMENT', 71);
  //   try {
  //     final response = await retryRequest(
  //       () => post(
  //         Uri.parse('https://asaasrefundpayment-667069547103.southamerica-east1.run.app'),
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode({
  //           'paymentId': FFAppState().paymentId,
  //         }),
  //       ),
  //       retries: 3,
  //       delay: const Duration(seconds: 2),
  //     );
//
  //     if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
  //       final responseData = jsonDecode(response.body);
  //       if (responseData['success'] == true) {
  //         logFirebaseEvent('payment_rollback_success');
  //         _logger.i('Payment successfully rolled back. Refunds: ${responseData['refunds']}');
  //       } else {
  //         logFirebaseEvent('payment_rollback_failed');
  //         _logger.w('Failed to roll back payment. Response: ${response.body}');
  //       }
  //     } else {
  //       logFirebaseEvent('payment_rollback_failed');
  //       _logger.w('Failed to roll back payment. Status: ${response?.statusCode}, Response: ${response?.body}');
  //     }
  //   } catch (e) {
  //     logFirebaseEvent('payment_rollback_exception');
  //     _logger.e('An error occurred while rolling back payment: $e');
  //   }
  // }

//Future<bool> callLalamove() async {
//
//   analytics_service.logFunnelStep('CALLING_LALAMOVE', 7);
//   const int maxRetries = 3; // Limit for retries
//   const Duration retryDelay = Duration(seconds: 2); // Delay between retries
//   int attempt = 0;
//
//   while (attempt < maxRetries) {
//     try {
//       logFirebaseEvent('call_lalamove_api_attempt', parameters: {'attempt': attempt + 1});
//
//       // Retrieve quotation data
//       LalamoveQuotationDataStruct quotationData =
//           functions.getObjectForUserRef(FFAppState().quotations.toList(), FFAppState().ownerRefPurchase!)!;
//
//       // Call Lalamove API
//       _model.lalamoveCallRequest = await actions.callDriverLalamove(
//         quotationData.stops.toList(),
//         quotationData.quotationId,
//         _model.renterObject!.fullName,
//         _model.renterObject!.phoneNumber,
//         valueOrDefault(currentUserDocument?.fullName, ''),
//         currentPhoneNumber,
//         valueOrDefault<String>(_model.orderId, '0'),
//       );
//
//       // Check response status
//       if (functions.checkStatusCode(_model.lalamoveCallRequest!)) {
//         logFirebaseEvent('lalamove_call_successful');
//         LalamoveOrderResponseStruct response =
//             LalamoveOrderResponseStruct.maybeFromMap(_model.lalamoveCallRequest)!;
//
//         FFAppState().addToLalamoveOrderResponses(response);
//
//         return true; // Delivery setup succeeded
//       } else {
//         logFirebaseEvent('lalamove_call_failed');
//         _logger.w('Lalamove call failed. Retrying...');
//       }
//     } catch (e) {
//       logFirebaseEvent('lalamove_exception');
//       _logger.e('An error occurred while calling Lalamove: $e');
//     }
//
//     attempt++;
//     if (attempt < maxRetries) {
//       await Future.delayed(retryDelay);
//     }
//   }
//
//   // All retries failed; handle failure
//   logFirebaseEvent('lalamove_retries_exhausted');
//   await showDialog(
//     context: context,
//     builder: (alertDialogContext) {
//       return WebViewAware(
//         child: AlertDialog(
//           title: const Text('Falha no Pedido'),
//           content: const Text(
//               'Não foi possível configurar a entrega com a Lalamove. O pagamento será revertido.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(alertDialogContext),
//               child: const Text('Ok'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
//
//   // Optionally, roll back payment (implement rollback logic if needed)
//   await rollbackPayment();
//
//   return false; // Delivery setup failed
// }

// Future<void> initiateLalamoveCall(BuildContext context) async {
    //
  //   logFirebaseEvent('initiate_lalamove_call');
//
  //   final ownerName = valueOrDefault(currentUserDocument?.fullName, '');
  //   final ownerPhoneNumber = currentPhoneNumber;
  //   final renterName = _model.renterObject?.fullName ?? '';
  //   final renterPhoneNumber = _model.renterObject?.phoneNumber ?? '';
  //   final orderId = valueOrDefault<String>(_model.orderId, '0');
//
  //   // Make the delivery call using DeliveryUtil.
  //   bool success = await deliveryUtil.callLalamove(
  //     ownerName,
  //     ownerPhoneNumber,
  //     renterName,
  //     renterPhoneNumber,
  //     orderId,
  //   );
//
  //   if (success) {
  //     await showDialog(
  //       context: context,
  //       builder: (alertDialogContext) {
  //         return AlertDialog(
  //           title: const Text('Entrega Configurada'),
  //           content: const Text('A entrega foi configurada com sucesso.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(alertDialogContext),
  //               child: const Text('Ok'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     await showDialog(
  //       context: context,
  //       builder: (alertDialogContext) {
  //         return AlertDialog(
  //           title: const Text('Falha na Entrega'),
  //           content: const Text(
  //               'Não foi possível configurar a entrega. O pagamento será revertido.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(alertDialogContext),
  //               child: const Text('Ok'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

// Future<void> updateAvailableDates({
  //   required DocumentReference gameRef,
  //   required List<DateTime> selectedDates,
  //   required DocumentReference ownerRef,
  // }) async {
  //   logFirebaseEvent('update_available_dates_in_backend');
//
  //   // Get the owner's "mygames" document reference
  //   final myGamesDocRef = ownerRef.collection('mygames').doc(gameRef.id);
//
  //   // Fetch the current availableDates array
  //   final myGamesDocSnapshot = await myGamesDocRef.get();
  //   if (!myGamesDocSnapshot.exists) {
  //     logFirebaseEvent('mygames_document_not_found');
  //     return;
  //   }
//
  //   final List<dynamic>? currentAvailableDates = myGamesDocSnapshot.data()?['availableDates'] as List<dynamic>?;
//
  //   if (currentAvailableDates == null || selectedDates.isEmpty) {
  //     logFirebaseEvent('no_available_dates_to_update');
  //     return;
  //   }
//
  //   // Remove the selected dates from the availableDates array
  //   final updatedAvailableDates = currentAvailableDates.where((date) {
  //     return !selectedDates.contains(date);
  //   }).toList();
//
  //   // Update the availableDates array in Firestore
  //   await myGamesDocRef.update({
  //     'availableDates': updatedAvailableDates,
  //   });
//
  //   logFirebaseEvent('available_dates_updated_successfully');
  // }

// Future<void> sendNotificationForRentalStatus({
//   required RentalStatus status,
//   required String gameName,
//   required DocumentReference gameRef,
//   required DocumentReference rentingUserRef,
//   required DocumentReference ownerRef,
// }) async {
//   NotificationTypes? notificationType;
//
//   switch (status) {
//     case RentalStatus.initiated:
//       notificationType = NotificationTypes.PAYMENT_CREATED;
//       break;
//     case RentalStatus.rented:
//       notificationType = NotificationTypes.GAME_RENTED;
//       break;
//     case RentalStatus.paid:
//       notificationType = NotificationTypes.ORDER_PAID;
//       break;
//     case RentalStatus.deliveryRented:
//       notificationType = NotificationTypes.DRIVER_GOING_OWNER;
//       break;
//     case RentalStatus.received:
//       notificationType = NotificationTypes.ORDER_DELIVERED_RENTER;
//       break;
//     case RentalStatus.deliveryReturned:
//       notificationType = NotificationTypes.DRIVER_GOING_RENTER;
//       break;
//     case RentalStatus.returned:
//       notificationType = NotificationTypes.ORDER_DELIVERED_OWNER;
//       break;
//     case RentalStatus.timeAdded:
//       notificationType = NotificationTypes.PAYMENT_UPDATED;
//       break;
//     case RentalStatus.cancelled:
//       notificationType = NotificationTypes.ORDER_CANCELLED;
//       break;
//     case RentalStatus.denied:
//       notificationType = NotificationTypes.ORDER_CANCELLED; // You can replace with a different type if needed
//       break;
//     default:
//       notificationType = NotificationTypes.GENERAL;
//   }
//
//   if (notificationType == null) return;
//
//   final notificationPayload = {
//     "title": "Status atualizado: $gameName",
//     "message": "O status do aluguel foi alterado para $status.",
//     "initial_page_name": "rentRequest",
//     "parameter_data": {
//       "gameRef": gameRef,
//       "rentingUserRef": rentingUserRef,
//     },
//     "user_ids": [ownerRef],
//     "type": notificationType.toString(),
//   };
//
//   try {
//     final response = await retryRequest(
//       () => post(
//         Uri.parse('https://<YOUR_CLOUD_FUNCTION_URL>/create_notification'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(notificationPayload),
//       ),
//       retries: 3,
//       delay: const Duration(seconds: 2),
//     );
//
//     if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
//       logFirebaseEvent('notification_sent_successfully');
//       _logger.i('Notification sent successfully. Response: ${response.body}');
//     } else {
//       logFirebaseEvent('notification_failed');
//       _logger.w('Failed to send notification. Status: ${response?.statusCode}, Response: ${response?.body}');
//     }
//   } catch (e) {
//     logFirebaseEvent('notification_exception');
//     _logger.e('An error occurred while sending notification: $e');
//   }
// }

// Future<void> updateRentalsRecords(RentalStatus status) async {
  //   logFirebaseEvent('update_records_in_backend');
//
  //   // Prepare common rental data
  //   final rentalId = _model.orderId ?? '0';
  //   final rentalDate = getCurrentTimestamp;
  //   final dueDate = FFAppState().dueDatePurchase;
  //   final pricePerDay = FFAppState().purchaseData.totalPrice;
  //   final deliveryFee = LalamoveOrderResponseStruct
  //           .maybeFromMap(_model.lalamoveCallRequest)
  //           ?.priceBreakdown
  //           .total ??
  //       0.0;
  //   final games = [widget.gameObject?.reference]?.where((game) => game != null).toList().cast<DocumentReference>();
//
//
  // // Create RentalsRecord for the renter
  //   await createOrUpdateRentalsRecord(
  //   userRef: currentUserReference!,
  //   rentalId: rentalId,
  //   rentalDate: rentalDate,
  //   dueDate: dueDate!,
  //   pricePerDay: pricePerDay,
  //   status: status,
  //   currentStatusTime: getCurrentTimestamp,
  //   isRenter: true,
  //   ownerID: FFAppState().ownerRefPurchase,
  //   renterID: currentUserReference,
  //   deliveryFee: deliveryFee,
  //   firstDeliveryDate: getCurrentTimestamp,
  //   games: games,
  // );
//
  //   // Create RentalsRecord for the owner
  //   await createOrUpdateRentalsRecord(
  //     userRef: FFAppState().ownerRefPurchase!,
  //     rentalId: rentalId,
  //     rentalDate: rentalDate,
  //     dueDate: dueDate,
  //     pricePerDay: pricePerDay,
  //     status: status,
  //     currentStatusTime: getCurrentTimestamp,
  //     isRenter: false,
  //     ownerID: FFAppState().ownerRefPurchase,
  //     renterID: currentUserReference,
  //     deliveryFee: deliveryFee,
  //     firstDeliveryDate: getCurrentTimestamp,
  //     games: games,
  //   );
//
//
  //   // Update user references
  //   await updateUserReferences();
//
  //    // Update available dates in the owner's "mygames" document
  //     await updateAvailableDates(
  //       gameRef: widget.gameObject!.reference,
  //       selectedDates: FFAppState().choosenRentDates,
  //       ownerRef: FFAppState().ownerRefPurchase!,
  //     );
//
  //       // Send notification based on the updated status
  //     await sendNotificationForRentalStatus(
  //       status: status,
  //       gameName: widget.gameObject!.name,
  //       gameRef: widget.gameObject!.reference,
  //       rentingUserRef: currentUserReference!,
  //       ownerRef: FFAppState().ownerRefPurchase!,
  //     );
//
//
  //   logFirebaseEvent('records_updated_successfully');
  // }

  Future<void> showSuccessDialogAndNavigate() async {
    logFirebaseEvent('order_completed_successfully');
    analytics_service.logFunnelStep('FLOW_COMPLETED', 8);
    //analytics_service.logPurchaseComplete(FFAppState().purchaseData.totalPrice);
    analytics_service.logRentalComplete('rental_complete', FFAppState().purchaseData.totalPrice);
    analytics_service.logPurchase(_model.orderId!, FFAppState().purchaseData.totalPrice, 'BRL');

       await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              title: const Text('Pedido realizado com Sucesso!'),
              content: const Text('O locador tem até 30 minutos para confirmar a locação.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            ),
          );
        },
      );

      logFirebaseEvent('navigate_to_homepage');
      context.pushNamed('HomePage');
    }

  Future<void> createRentalRecordAndStartPayment() async {
        // Generate a unique external reference for this rental/payment session
      FFAppState().externalReference = '${random_data.randomString(8, 8, true, true, true)}${currentUserReference?.id}';
      analytics_service.logBeginCheckout(FFAppState().purchaseData.totalPrice);

      // Prepare initial rental data
      // Map<String, dynamic> rentalData = {
      //   'createdDate': DateTime.now(),
      //   'renterId': currentUserReference,
      //   'status': 'initiated', // Initial status for tracking
      //   'externalReference': FFAppState().externalReference, // Link to payment
      // };

       await RentsUtil.updateRentalsRecords(status: RentalStatus.initiated, 
       gameRef: widget.gameObject!.reference, 
       renterRef: currentUserReference!, 
       ownerRef: FFAppState().ownerRefPurchase!,
       gameName: widget.gameObject!.name,
       pricePerDay:FFAppState().purchaseData.price,
       dueDate: FFAppState().dueDatePurchase!,
       selectedGames: List.from([widget.gameObject!.reference]),
       );

      //create a function to add a document in usersRental collection with 2 fields: renterId and Owner Id
      final usersRentalCollection = FirebaseFirestore.instance.collection('usersRental');

      DocumentReference rentalRef = usersRentalCollection.doc(_model.orderId);

      await rentalRef.set({
        'renterId': currentUserReference,
        'ownerId': FFAppState().ownerRefPurchase,
        'ownerRentalsId': _model.documentOwner?.reference,
        'renterRentalsId': _model.documentRenting?.reference,
      });

        
      _model.usersRentalRef = rentalRef;

      
      bool useCard = await choosePaymentMethod();
      bool paymentSuccess = false;

      if (useCard) {
        paymentSuccess = await processCardPayment(rentalRef);
        analytics_service.logSelectPaymentMethod('CREDIT_CARD');
      } else {
        paymentSuccess = await processPixPayment(rentalRef);
        analytics_service.logSelectPaymentMethod('PIX');
      }

      if (!paymentSuccess) return;


     // if (!await callLalamove()) {
      //  logFirebaseEvent('delivery_setup_failed');
     //   return; 
    //  }

      

      await showSuccessDialogAndNavigate();
    }


  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();
 
    return Title(
        title: 'Lista de Alugueis',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'TO_RENT_LIST_arrow_back_rounded_ICN_ON_T');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                  ),
                ),
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Jogos disponíveis',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Abaixo estão os jogos disponíveis para alugar',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final userListFromGame =
                                  widget.gameObject?.availableAt.toList() ??
                                      [];
                              if (userListFromGame.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/logo_text.png',
                                    fit: BoxFit.contain,
                                  ),
                                );
                              }

                              return RefreshIndicator(
                                onRefresh: () async {},
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: userListFromGame.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16.0),
                                  itemBuilder:
                                      (context, userListFromGameIndex) {
                                    final userListFromGameItem =
                                        userListFromGame[userListFromGameIndex];
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GameToRentWidget(
                                            key: Key(
                                                'Keyew5_${userListFromGameIndex}_of_${userListFromGame.length}'),
                                            userRef: userListFromGameItem,
                                            gameRef: widget.gameObject!.reference,
                                            gameName: widget.gameObject!.name,
                                            allowCalendarIcon: true,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                  logFirebaseEvent('pagar_button_pressed');
                                  if (!await checkRenterSelection()) return;

                                  analytics_service.logFunnelStep('STARTED_PAYMENT', 5);
                                  await createRentalRecordAndStartPayment();                               
                                  //await updateRecords();
                                  await showSuccessDialogAndNavigate();
                                      },
                              text: "Pagar", 
                              icon: Icon(
                                Icons.request_quote,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 32.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

