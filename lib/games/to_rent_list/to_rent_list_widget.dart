import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
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
              preferredSize: Size.fromHeight(40.0),
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
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final userListFromGame =
                                widget!.gameObject?.availableAt?.toList() ?? [];
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
                                itemBuilder: (context, userListFromGameIndex) {
                                  final userListFromGameItem =
                                      userListFromGame[userListFromGameIndex];
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: GameToRentWidget(
                                      key: Key(
                                          'Keyew5_${userListFromGameIndex}_of_${userListFromGame.length}'),
                                      userRef: userListFromGameItem,
                                      gameRef: widget!.gameObject!.reference,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.08,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TO_RENT_LIST_PAGE_PAGAR_BTN_ON_TAP');
                                    logFirebaseEvent('Button_alert_dialog');
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text(
                                                        'Método de Pagamento'),
                                                    content: Text(
                                                        'Qual método de pagamento você deseja usar?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Pix'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
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
                                            currentUserDocument?.asaasClientId,
                                            ''),
                                        value: 35.0,
                                        description: 'Jogo',
                                        externalReference: '123456',
                                      );

                                      if ((_model
                                              .createdBillingcard?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Pagameto iniciado',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        logFirebaseEvent('Button_launch_u_r_l');
                                        await launchURL(getJsonField(
                                          (_model.createdBillingcard
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.paymentLink''',
                                        ).toString());
                                        logFirebaseEvent('Button_backend_call');
                                        _model.paymentstatuscard =
                                            await PaymentStatusCall.call(
                                          acct:
                                              '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                          paymentId: getJsonField(
                                            (_model.createdBillingcard
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.id''',
                                          ).toString(),
                                        );

                                        if ((_model
                                                .paymentstatuscard?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title:
                                                      Text('Aluguel Efetuado!'),
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
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Erro no pagamento!'),
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
                                        }
                                      }
                                    } else {
                                      logFirebaseEvent('Button_backend_call');
                                      _model.createdBillingPix =
                                          await CreateBillingPixCall.call(
                                        acct:
                                            '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                        customer: valueOrDefault(
                                            currentUserDocument?.asaasClientId,
                                            ''),
                                        value: 35.0,
                                        description: 'Jogo',
                                        externalReference: '123674',
                                      );

                                      if ((_model
                                              .createdBillingPix?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'Button_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Pagameto iniciado',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
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
                                        logFirebaseEvent('Button_backend_call');
                                        _model.paymentstatuspix =
                                            await PaymentStatusCall.call(
                                          acct:
                                              '\$aact_YTU5YTE0M2M2N2I4MTliNzk0YTI5N2U5MzdjNWZmNDQ6OjAwMDAwMDAwMDAwMDA0ODk0MjU6OiRhYWNoXzRkOWJlY2Q2LWMyNGItNGI0MC05YTExLTlhYTE0NTdkZDgwNg==',
                                          paymentId: getJsonField(
                                            (_model.createdBillingPix
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.id''',
                                          ).toString(),
                                        );

                                        if ((_model
                                                .paymentstatuspix?.succeeded ??
                                            true)) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title:
                                                      Text('Aluguel Efetuado!'),
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
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Erro no pagamento!'),
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
                                        }
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Pagar',
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                            ),
                          ],
                        ),
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
