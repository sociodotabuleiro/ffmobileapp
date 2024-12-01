import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'to_rent_list_model.dart';
export 'to_rent_list_model.dart';

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

    return Title(
        title: 'toRentList',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
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
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final userListFromGame =
                                  widget!.gameObject?.availableAt?.toList() ??
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
                                      SizedBox(height: 16.0),
                                  itemBuilder:
                                      (context, userListFromGameIndex) {
                                    final userListFromGameItem =
                                        userListFromGame[userListFromGameIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
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
                                                widget!.gameObject!.reference,
                                            gameName: widget!.gameObject!.name,
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'TO_RENT_LIST_PAGE_PAGAR_BTN_ON_TAP');
                                var _shouldSetState = false;
                                logFirebaseEvent('Button_backend_call');
                                _model.renterObject =
                                    await UsersRecord.getDocumentOnce(
                                        FFAppState().renterRef!);
                                _shouldSetState = true;
                                if (!(_model.renterObject?.reference != null)) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title:
                                              Text('Sem escolha de usuário!'),
                                          content: Text(
                                              'Por favor escolha um locador e uma data!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                logFirebaseEvent('Button_alert_dialog');
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Método de Pagamento'),
                                            content: Text(
                                                'Qual método de pagamento você deseja usar?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Pix'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Cartão'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ) ??
                                    false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.createdBillingcard =
                                      await CreateBillingCardCall.call(
                                    acct:
                                        '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                    customer: valueOrDefault(
                                        currentUserDocument?.asaasClientId, ''),
                                    value: FFAppState()
                                            .purchaseData
                                            .quantity
                                            .toDouble() +
                                        functions
                                            .getObjectForUserRef(
                                                FFAppState()
                                                    .quotations
                                                    .toList(),
                                                FFAppState().renterRef!)!
                                            .priceBreakdown
                                            .total,
                                    description: widget!.gameObject?.name,
                                    externalReference:
                                        '${random_data.randomString(
                                      8,
                                      8,
                                      true,
                                      true,
                                      true,
                                    )}${currentUserReference?.id}',
                                  );

                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.orderId = getJsonField(
                                    (_model.createdBillingcard?.jsonBody ?? ''),
                                    r'''$.externalReference''',
                                  ).toString();
                                  safeSetState(() {});
                                  if ((_model.createdBillingcard?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pagameto iniciado',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    logFirebaseEvent('Button_launch_u_r_l');
                                    await launchURL(getJsonField(
                                      (_model.createdBillingcard?.jsonBody ??
                                          ''),
                                      r'''$.paymentLink''',
                                    ).toString());
                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 60000));
                                    logFirebaseEvent('Button_backend_call');
                                    _model.paymentstatuscard =
                                        await PaymentStatusCall.call(
                                      acct:
                                          '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                      paymentId: getJsonField(
                                        (_model.createdBillingcard?.jsonBody ??
                                            ''),
                                        r'''$.id''',
                                      ).toString(),
                                    );

                                    _shouldSetState = true;
                                    if ((_model.paymentstatuscard?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Aluguel Efetuado!'),
                                              content: Text(
                                                  'Aluguel Efetuado com Sucesso!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Erro no pagamento!'),
                                              content: Text(
                                                  'Erro ao efetuar Pagamento'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.createdBillingPix =
                                      await CreateBillingPixCall.call(
                                    acct:
                                        '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                    customer: valueOrDefault(
                                        currentUserDocument?.asaasClientId, ''),
                                    value: FFAppState()
                                            .purchaseData
                                            .quantity
                                            .toDouble() +
                                        functions
                                            .getObjectForUserRef(
                                                FFAppState()
                                                    .quotations
                                                    .toList(),
                                                FFAppState().renterRef!)!
                                            .priceBreakdown
                                            .total,
                                    description: widget!.gameObject?.name,
                                    externalReference:
                                        '${random_data.randomString(
                                      8,
                                      8,
                                      true,
                                      true,
                                      true,
                                    )}${currentUserReference?.id}',
                                  );

                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.orderId = getJsonField(
                                    (_model.createdBillingPix?.jsonBody ?? ''),
                                    r'''$.externalReference''',
                                  ).toString();
                                  safeSetState(() {});
                                  if ((_model.createdBillingPix?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pagameto iniciado',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    logFirebaseEvent('Button_launch_u_r_l');
                                    await launchURL(getJsonField(
                                      (_model.createdBillingPix?.jsonBody ??
                                          ''),
                                      r'''$.paymentLink''',
                                    ).toString());
                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 60000));
                                    logFirebaseEvent('Button_backend_call');
                                    _model.paymentstatuspix =
                                        await PaymentStatusCall.call(
                                      acct:
                                          '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                      paymentId: getJsonField(
                                        (_model.createdBillingPix?.jsonBody ??
                                            ''),
                                        r'''$.id''',
                                      ).toString(),
                                    );

                                    _shouldSetState = true;
                                    if ((_model.paymentstatuspix?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Aluguel Efetuado!'),
                                              content: Text(
                                                  'Aluguel Efetuado com Sucesso!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('Erro no pagamento!'),
                                              content: Text(
                                                  'Erro ao efetuar Pagamento'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }

                                logFirebaseEvent('Button_custom_action');
                                _model.lalamoveCallRequest =
                                    await actions.callDriverLalamove(
                                  functions
                                      .getObjectForUserRef(
                                          FFAppState().quotations.toList(),
                                          FFAppState().renterRef!)!
                                      .stops
                                      .toList(),
                                  functions
                                      .getObjectForUserRef(
                                          FFAppState().quotations.toList(),
                                          FFAppState().renterRef!)!
                                      .quotationId,
                                  _model.renterObject!.fullName,
                                  _model.renterObject!.phoneNumber,
                                  valueOrDefault(
                                      currentUserDocument?.fullName, ''),
                                  currentPhoneNumber,
                                  valueOrDefault<String>(
                                    _model.orderId,
                                    '0',
                                  ),
                                );
                                _shouldSetState = true;
                                if (!functions.checkStatusCode(
                                    _model.lalamoveCallRequest!)) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: Text('Falha!'),
                                          content: Text(
                                              'A chamada do motorista falhou, tentaremos novamente.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().deliveryData = DeliveryDataStruct(
                                  externalId:
                                      LalamoveOrderResponseStruct.maybeFromMap(
                                              _model.lalamoveCallRequest)
                                          ?.metadata
                                          ?.orderId,
                                  shortExternalReference:
                                      LalamoveOrderResponseStruct.maybeFromMap(
                                              _model.lalamoveCallRequest)
                                          ?.metadata
                                          ?.orderId,
                                  address: currentUserDocument?.address,
                                  customer: CustomerDeliveryStruct(
                                    document: valueOrDefault(
                                        currentUserDocument?.cpf, ''),
                                    name: valueOrDefault(
                                        currentUserDocument?.fullName, ''),
                                    phone: currentPhoneNumber,
                                  ),
                                  payments: PaymentsDeliveryStruct(
                                    name: 'Crédito',
                                    code: 'ONLINE',
                                    value:
                                        FFAppState().purchaseData.totalPrice +
                                            10,
                                  ),
                                  deliveryDatetime:
                                      functions.getCurrentTimeInIso8601(30),
                                  preparationStart:
                                      functions.getCurrentTimeInIso8601(0),
                                  orderCreatedAt:
                                      functions.getCurrentTimeInIso8601(0),
                                  preparationTimeInSeconds: 120,
                                  totalPrice:
                                      LalamoveQuotationDataStruct.maybeFromMap(
                                              _model.lalamoveCallRequest)
                                          ?.priceBreakdown
                                          ?.total,
                                  marketplaceName: '0',
                                  marketplaceId: '0',
                                  items: ItemsDeliveryStruct(
                                    name: widget!.gameObject?.name,
                                    price: FFAppState().purchaseData.price,
                                    quantity: 1,
                                    totalPrice:
                                        FFAppState().purchaseData.totalPrice,
                                    externalId: valueOrDefault<String>(
                                      FFAppState()
                                          .deliveryData
                                          .items
                                          .externalId,
                                      '000',
                                    ),
                                  ),
                                );
                                safeSetState(() {});
                                logFirebaseEvent('Button_backend_call');

                                var rentalsRecordReference1 =
                                    RentalsRecord.createDoc(
                                        currentUserReference!);
                                await rentalsRecordReference1.set({
                                  ...createRentalsRecordData(
                                    rentalID: valueOrDefault<String>(
                                      _model.orderId,
                                      '0',
                                    ),
                                    ownerID: FFAppState().ownerRefPurchase,
                                    renterID: currentUserReference,
                                    rentalDate: getCurrentTimestamp,
                                    dueDate: FFAppState().dueDatePurchase,
                                    pricePerDay:
                                        FFAppState().purchaseData.totalPrice,
                                    deliveryFee: LalamoveOrderResponseStruct
                                            .maybeFromMap(
                                                _model.lalamoveCallRequest)
                                        ?.priceBreakdown
                                        ?.total,
                                    status: RentalStatus.rented,
                                    currentStatusTime: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'games': [widget!.gameObject?.reference],
                                    },
                                  ),
                                });
                                _model.documentRenting =
                                    RentalsRecord.getDocumentFromData({
                                  ...createRentalsRecordData(
                                    rentalID: valueOrDefault<String>(
                                      _model.orderId,
                                      '0',
                                    ),
                                    ownerID: FFAppState().ownerRefPurchase,
                                    renterID: currentUserReference,
                                    rentalDate: getCurrentTimestamp,
                                    dueDate: FFAppState().dueDatePurchase,
                                    pricePerDay:
                                        FFAppState().purchaseData.totalPrice,
                                    deliveryFee: LalamoveOrderResponseStruct
                                            .maybeFromMap(
                                                _model.lalamoveCallRequest)
                                        ?.priceBreakdown
                                        ?.total,
                                    status: RentalStatus.rented,
                                    currentStatusTime: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'games': [widget!.gameObject?.reference],
                                    },
                                  ),
                                }, rentalsRecordReference1);
                                _shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');

                                var rentalsRecordReference2 =
                                    RentalsRecord.createDoc(
                                        FFAppState().renterRef!);
                                await rentalsRecordReference2.set({
                                  ...createRentalsRecordData(
                                    rentalID: valueOrDefault<String>(
                                      _model.orderId,
                                      '0',
                                    ),
                                    ownerID: FFAppState().ownerRefPurchase,
                                    renterID: currentUserReference,
                                    rentalDate: getCurrentTimestamp,
                                    dueDate: FFAppState().dueDatePurchase,
                                    pricePerDay:
                                        FFAppState().purchaseData.totalPrice,
                                    deliveryFee: LalamoveOrderResponseStruct
                                            .maybeFromMap(
                                                _model.lalamoveCallRequest)
                                        ?.priceBreakdown
                                        ?.total,
                                    status: RentalStatus.rented,
                                    currentStatusTime: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'games': [widget!.gameObject?.reference],
                                    },
                                  ),
                                });
                                _model.documentOwner =
                                    RentalsRecord.getDocumentFromData({
                                  ...createRentalsRecordData(
                                    rentalID: valueOrDefault<String>(
                                      _model.orderId,
                                      '0',
                                    ),
                                    ownerID: FFAppState().ownerRefPurchase,
                                    renterID: currentUserReference,
                                    rentalDate: getCurrentTimestamp,
                                    dueDate: FFAppState().dueDatePurchase,
                                    pricePerDay:
                                        FFAppState().purchaseData.totalPrice,
                                    deliveryFee: LalamoveOrderResponseStruct
                                            .maybeFromMap(
                                                _model.lalamoveCallRequest)
                                        ?.priceBreakdown
                                        ?.total,
                                    status: RentalStatus.rented,
                                    currentStatusTime: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'games': [widget!.gameObject?.reference],
                                    },
                                  ),
                                }, rentalsRecordReference2);
                                _shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'rentedFromCount':
                                          FieldValue.increment(1),
                                      'rentedFrom': FieldValue.arrayUnion(
                                          [FFAppState().renterRef]),
                                      'rentedFromIds': FieldValue.arrayUnion(
                                          [_model.documentRenting?.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Button_backend_call');

                                await FFAppState().renterRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'rentedToCount': FieldValue.increment(1),
                                      'rentedTo': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                      'rentedToIds': FieldValue.arrayUnion(
                                          [_model.documentOwner?.reference]),
                                    },
                                  ),
                                });
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text(
                                            'Pedido realizado com Sucesso!'),
                                        content: Text(
                                            'Seu pedido foi realizado! Logo mais ele estará chegando até você!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                logFirebaseEvent('Button_backend_call');

                                var usersRentalRecordReference =
                                    UsersRentalRecord.collection
                                        .doc(_model.documentRenting!.rentalID);
                                await usersRentalRecordReference
                                    .set(createUsersRentalRecordData(
                                  renterId: currentUserReference,
                                  ownerId: FFAppState().renterRef,
                                ));
                                _model.usersRentalObject =
                                    UsersRentalRecord.getDocumentFromData(
                                        createUsersRentalRecordData(
                                          renterId: currentUserReference,
                                          ownerId: FFAppState().renterRef,
                                        ),
                                        usersRentalRecordReference);
                                _shouldSetState = true;
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('HomePage');

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'Pagar',
                              icon: Icon(
                                Icons.request_quote,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 32.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                borderSide: BorderSide(
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
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
