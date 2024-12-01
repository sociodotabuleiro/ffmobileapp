import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
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

final Logger _logger = Logger();


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
      response = await request();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      }
      _logger.w('Request failed with status: ${response.statusCode}. Retrying...');
    } catch (e) {
      _logger.w('Exception occurred: $e. Retrying...');
    }

    attempt++;
    if (attempt < retries) await Future.delayed(delay);
  }
  return response; // Returns the last response or null if all retries failed
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
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

 Future<DocumentReference> createOrUpdateRentalsRecord({
  required DocumentReference userRef,
  required String rentalId,
  required DateTime rentalDate,
  required DateTime dueDate,
  required double pricePerDay,
  required RentalStatus status,
  required DateTime currentStatusTime,
  required bool isRenter,
  DocumentReference? ownerID,
  DocumentReference? renterID,
  double? deliveryFee,
  DateTime? firstDeliveryDate,
  List<DocumentReference>? games,
}) async {
  logFirebaseEvent('create_or_update_rentals_record');

  // Prepare the rentals record data
  final rentalsRecordData = {
    'rentalID': rentalId,
    'rentalDate': rentalDate,
    'dueDate': dueDate,
    'pricePerDay': pricePerDay,
    'status': status,
    'currentStatusTime': currentStatusTime,
    if (deliveryFee != null) 'deliveryFee': deliveryFee,
    if (firstDeliveryDate != null) 'firstDeliveryDate': firstDeliveryDate,
    if (ownerID != null) 'ownerID': ownerID,
    if (renterID != null) 'renterID': renterID,
    if (games != null) 'games': games,
  };

  final rentalRef = RentalsRecord.createDoc(userRef, id: rentalId);
  await rentalRef.set(rentalsRecordData);

  final rentalsRecord = RentalsRecord.getDocumentFromData(rentalsRecordData, rentalRef);

  if (isRenter) {
    _model.documentRenting = rentalsRecord;
  } else {
    _model.documentOwner = rentalsRecord;
  }

  return rentalRef;
}



  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

     

      Future<void> updateUserReferences() async {
        logFirebaseEvent('update_user_references');

        // Update current user's (renter's) document
        await currentUserReference!.update({
          'rentedFromCount': FieldValue.increment(1),
          'rentedFrom': FieldValue.arrayUnion([FFAppState().renterRef]),
          'rentedFromIds': FieldValue.arrayUnion([_model.documentRenting?.reference]),
        });

        // Update owner's document
        await FFAppState().renterRef!.update({
          'rentedToCount': FieldValue.increment(1),
          'rentedTo': FieldValue.arrayUnion([currentUserReference]),
          'rentedToIds': FieldValue.arrayUnion([_model.documentOwner?.reference]),
        });
      }

      Future<bool> checkRenterSelection() async {
        logFirebaseEvent('get_renter_object');
        _model.renterObject = await UsersRecord.getDocumentOnce(FFAppState().renterRef!);

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

    // Prepare payment data with usersRentalRef
    Map<String, dynamic> paymentData = {
      'customer': currentUserDocument?.asaasClientId ?? '',
      'value': FFAppState().purchaseData.quantity.toDouble() +
          functions.getObjectForUserRef(
            FFAppState().quotations.toList(),
            FFAppState().renterRef!,
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

  // Prepare payment data with usersRentalRef
  Map<String, dynamic> paymentData = {
    'customer': currentUserDocument?.asaasClientId ?? '',
    'value': FFAppState().purchaseData.quantity.toDouble() +
        functions.getObjectForUserRef(
          FFAppState().quotations.toList(),
          FFAppState().renterRef!,
        )!.priceBreakdown.total,
    'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 7))),
    'description': widget.gameObject?.name ?? '',
    'externalReference': FFAppState().externalReference,
    'usersRentalRef': rentalRef.path, // Pass the Firestore path of the rental document
  };

  return await processPayment(paymentData, 'PIX');
} 
      
      Future<bool> callLalamove() async {
        logFirebaseEvent('call_lalamove_api');
        LalamoveQuotationDataStruct quotationData = functions.getObjectForUserRef(FFAppState().quotations.toList(), FFAppState().renterRef!)!;
        _model.lalamoveCallRequest = await actions.callDriverLalamove(
          quotationData.stops.toList(),
          quotationData.quotationId,
          _model.renterObject!.fullName,
          _model.renterObject!.phoneNumber,
          valueOrDefault(currentUserDocument?.fullName, ''),
          currentPhoneNumber,
          valueOrDefault<String>(_model.orderId, '0'),
        );

        if (!functions.checkStatusCode(_model.lalamoveCallRequest!)) {
          logFirebaseEvent('lalamove_call_failed');
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  title: const Text('Falha!'),
                  content: const Text('A chamada do motorista falhou, tentaremos novamente.'),
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

        logFirebaseEvent('lalamove_call_successful');

        LalamoveOrderResponseStruct response = LalamoveOrderResponseStruct.maybeFromMap(_model.lalamoveCallRequest)!;

        FFAppState().addToLalamoveOrderResponses(response);

        return true;
      }

      Future<void> updateAvailableDates() async {
        logFirebaseEvent('update_available_dates_in_backend');

        // Get the owner's mygames document reference
        final myGamesDocRef = FFAppState().ownerRefPurchase!.collection('mygames').doc(widget.gameObject?.reference.id);

        // Fetch the current availableDates array
        final myGamesDocSnapshot = await myGamesDocRef.get();
        if (!myGamesDocSnapshot.exists) {
          logFirebaseEvent('mygames_document_not_found');
          return;
        }

        final List<dynamic>? currentAvailableDates = myGamesDocSnapshot.data()?['availableDates'] as List<dynamic>?;

        // Ensure the availableDates array and selected dates are valid
        if (currentAvailableDates == null || FFAppState().choosenRentDates.isEmpty) {
          logFirebaseEvent('no_available_dates_to_update');
          return;
        }

        // Remove the selected dates from the availableDates array
        final updatedAvailableDates = currentAvailableDates.where((date) {
          return !FFAppState().choosenRentDates.contains(date);
        }).toList();

        // Update the availableDates array in Firestore
        await myGamesDocRef.update({
          'availableDates': updatedAvailableDates,
        });

        logFirebaseEvent('available_dates_updated_successfully');
      }

      Future<void> updateRentalsRecords(RentalStatus status) async {
        logFirebaseEvent('update_records_in_backend');

        // Prepare common rental data
        final rentalId = _model.orderId ?? '0';
        final rentalDate = getCurrentTimestamp;
        final dueDate = FFAppState().dueDatePurchase;
        final pricePerDay = FFAppState().purchaseData.totalPrice;
        final deliveryFee = LalamoveOrderResponseStruct
                .maybeFromMap(_model.lalamoveCallRequest)
                ?.priceBreakdown
                .total ??
            0.0;
       final games = [widget.gameObject?.reference]?.where((game) => game != null).toList().cast<DocumentReference>();


      // Create RentalsRecord for the renter
       await createOrUpdateRentalsRecord(
        userRef: currentUserReference!,
        rentalId: rentalId,
        rentalDate: rentalDate,
        dueDate: dueDate!,
        pricePerDay: pricePerDay,
        status: status,
        currentStatusTime: getCurrentTimestamp,
        isRenter: true,
        ownerID: FFAppState().ownerRefPurchase,
        renterID: currentUserReference,
        deliveryFee: deliveryFee,
        firstDeliveryDate: getCurrentTimestamp,
        games: games,
      );

        // Create RentalsRecord for the owner
        await createOrUpdateRentalsRecord(
          userRef: FFAppState().ownerRefPurchase!,
          rentalId: rentalId,
          rentalDate: rentalDate,
          dueDate: dueDate,
          pricePerDay: pricePerDay,
          status: status,
          currentStatusTime: getCurrentTimestamp,
          isRenter: false,
          ownerID: FFAppState().ownerRefPurchase,
          renterID: currentUserReference,
          deliveryFee: deliveryFee,
          firstDeliveryDate: getCurrentTimestamp,
          games: games,
        );


        // Update user references
        await updateUserReferences();

         // Update available dates in the owner's mygames document
        await updateAvailableDates();

        logFirebaseEvent('records_updated_successfully');
      }

      Future<void> showSuccessDialogAndNavigate() async {
        logFirebaseEvent('order_completed_successfully');

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Pedido realizado com Sucesso!'),
                content: const Text('Seu pedido foi realizado! Logo mais ele estará chegando até você!'),
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

      // Prepare initial rental data
      Map<String, dynamic> rentalData = {
        'createdDate': DateTime.now(),
        'renterId': currentUserReference,
        'status': 'initiated', // Initial status for tracking
        'externalReference': FFAppState().externalReference, // Link to payment
      };

       await updateRentalsRecords(RentalStatus.initiated);

      //create a function to add a document in usersRental collection with 2 fields: renterId and Owner Id
      
      final rentalRef = await UsersRentalRecord.createDoc(currentUserReference!, id: FFAppState().externalReference).set(rentalData);
    



      // Store the reference for payment tracking
      _model.usersRentalRef = rentalRef;

      // Step 2: Proceed with choosing payment method and initiating payment
      bool useCard = await choosePaymentMethod();
      bool paymentSuccess = false;

      if (useCard) {
        paymentSuccess = await processCardPayment(rentalRef);
      } else {
        paymentSuccess = await processPixPayment(rentalRef);
      }

      if (!paymentSuccess) return;

      // Step 3: Complete the rental and initiate delivery if payment is successful
      if (!await callLalamove()) return;

     

      await showSuccessDialogAndNavigate();
    }

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

                                   await createRentalRecordAndStartPayment();                               

                                  await updateRecords();

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

