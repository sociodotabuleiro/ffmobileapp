import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

      Future<void> createRentalsRecordForUser(DocumentReference userRef, Map<String, dynamic> data, {required bool isRenter}) async {
        logFirebaseEvent('create_rentals_record_for_user');

        var rentalsRecordReference = RentalsRecord.createDoc(userRef);
        await rentalsRecordReference.set(data);

        var rentalsRecord = RentalsRecord.getDocumentFromData(data, rentalsRecordReference);

        if (isRenter) {
          _model.documentRenting = rentalsRecord;
        } else {
          _model.documentOwner = rentalsRecord;
        }
      }

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

      Future<bool> processCardPayment() async {
        logFirebaseEvent('payment_card_chosen');

        // Prepare the payment data
        Map<String, dynamic> paymentData = {
          'customer': currentUserDocument?.asaasClientId ?? '',
          'billingType': 'CREDIT_CARD',
          'value': FFAppState().purchaseData.quantity.toDouble() +
              functions.getObjectForUserRef(
                FFAppState().quotations.toList(),
                FFAppState().renterRef!,
              )!.priceBreakdown.total,
          'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 7))), // Set due date as needed
          'description': widget.gameObject?.name ?? '',
          'externalReference': '${random_data.randomString(8, 8, true, true, true)}${currentUserReference?.id}',
        };

        try {
          // Send POST request to your backend endpoint
          final response = await post(
            Uri.parse('https://createbillingpaymentasaas-667069547103.us-central1.run.app'), // Replace with your actual endpoint URL
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(paymentData),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            // Payment created successfully
            final responseData = jsonDecode(response.body);
            logFirebaseEvent('payment_initiated_successfully');

            // Extract necessary data from response
            _model.orderId = responseData['externalReference']?.toString() ?? '0';
            safeSetState(() {});

            // Handle payment link if provided
            String? paymentLink = responseData['invoiceUrl'] ?? responseData['bankSlipUrl'] ?? responseData['invoiceUrl'];

            if (paymentLink != null) {
              await launchURL(paymentLink);
            }

            // Since payment status will be updated asynchronously via webhook, proceed without waiting
            return true;
          } else {
            // Handle error response
            logFirebaseEvent('payment_creation_failed');
            print('Error: ${response.statusCode} - ${response.body}');
            // Show error message to user
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: const Text('Erro ao iniciar pagamento!'),
                  content: Text('Status: ${response.statusCode}\nErro: ${response.body}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            );
            return false;
          }
        } catch (e) {
          // Handle exceptions
          logFirebaseEvent('payment_exception');
          print('Exception: $e');
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Erro ao iniciar pagamento!'),
                content: Text('Erro: $e'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
          return false;
        }
      }
     
      Future<bool> processPixPayment() async {
        logFirebaseEvent('payment_pix_chosen');

        // Prepare the payment data
        Map<String, dynamic> paymentData = {
          'customer': currentUserDocument?.asaasClientId ?? '',
          'billingType': 'PIX',
          'value': FFAppState().purchaseData.quantity.toDouble() +
              functions.getObjectForUserRef(
                FFAppState().quotations.toList(),
                FFAppState().renterRef!,
              )!.priceBreakdown.total,
          'dueDate': DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 7))), // Set due date as needed
          'description': widget.gameObject?.name ?? '',
          'externalReference': '${random_data.randomString(8, 8, true, true, true)}${currentUserReference?.id}',
        };

        try {
          // Send POST request to your backend endpoint
          final response = await post(
            Uri.parse('https://createbillingpaymentasaas-667069547103.us-central1.run.app'), // Replace with your actual endpoint URL
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(paymentData),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            // Payment created successfully
            final responseData = jsonDecode(response.body);
            logFirebaseEvent('payment_initiated_successfully');

            // Extract necessary data from response
            _model.orderId = responseData['externalReference']?.toString() ?? '0';
            safeSetState(() {});

            // Handle payment link if provided
            String? paymentLink = responseData['invoiceUrl'] ?? responseData['bankSlipUrl'] ?? responseData['invoiceUrl'];

            if (paymentLink != null) {
              await launchURL(paymentLink);
            }

            // Since payment status will be updated asynchronously via webhook, proceed without waiting
            return true;
          } else {
            // Handle error response
            logFirebaseEvent('payment_creation_failed');
            print('Error: ${response.statusCode} - ${response.body}');
            // Show error message to user
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: const Text('Erro ao iniciar pagamento!'),
                  content: Text('Status: ${response.statusCode}\nErro: ${response.body}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            );
            return false;
          }
        } catch (e) {
          // Handle exceptions
          logFirebaseEvent('payment_exception');
          print('Exception: $e');
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: const Text('Erro ao iniciar pagamento!'),
                content: Text('Erro: $e'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
          return false;
        }
      }
     
      Future<bool> callLalamove() async {
        logFirebaseEvent('call_lalamove_api');

        _model.lalamoveCallRequest = await actions.callDriverLalamove(
          functions.getObjectForUserRef(FFAppState().quotations.toList(), FFAppState().renterRef!)!.stops.toList(),
          functions.getObjectForUserRef(FFAppState().quotations.toList(), FFAppState().renterRef!)!.quotationId,
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
        // Update FFAppState().deliveryData as needed
        // ...

        return true;
      }

      Future<void> updateRecords() async {
        logFirebaseEvent('update_records_in_backend');

        // Prepare the rentals record data
        Map<String, dynamic> rentalsRecordData = {
          ...createRentalsRecordData(
            rentalID: _model.orderId ?? '0',
            ownerID: FFAppState().ownerRefPurchase,
            renterID: currentUserReference,
            rentalDate: getCurrentTimestamp,
            dueDate: FFAppState().dueDatePurchase,
            pricePerDay: FFAppState().purchaseData.totalPrice,
            deliveryFee: LalamoveOrderResponseStruct.maybeFromMap(_model.lalamoveCallRequest)?.priceBreakdown.total ?? 0.0,
            status: RentalStatus.rented,
            currentStatusTime: getCurrentTimestamp,
          ),
          'games': [widget.gameObject?.reference],
        };

        // Create RentalsRecord for the current user (renter)
        await createRentalsRecordForUser(currentUserReference!, rentalsRecordData, isRenter: true);

        // Create RentalsRecord for the owner
        await createRentalsRecordForUser(FFAppState().renterRef!, rentalsRecordData, isRenter: false);

        // Update user references
        await updateUserReferences();

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



    return Title(
        title: 'toRentList',
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
                                            gameRef:
                                                widget.gameObject!.reference,
                                            gameName: widget.gameObject!.name,
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

                                  bool useCard = await choosePaymentMethod();
                                  bool paymentSuccess = false;

                                  if (useCard) {
                                    paymentSuccess = await processCardPayment();
                                  } else {
                                    paymentSuccess = await processPixPayment();
                                  }

                                  if (!paymentSuccess) return;

                                  if (!await callLalamove()) return;

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

