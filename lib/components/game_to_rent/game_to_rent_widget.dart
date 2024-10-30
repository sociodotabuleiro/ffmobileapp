import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/calendar_choose_date_rent/calendar_choose_date_rent_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'game_to_rent_model.dart';
export 'game_to_rent_model.dart';

class GameToRentWidget extends StatefulWidget {
  const GameToRentWidget({
    super.key,
    required this.userRef,
    required this.gameRef,
  });

  final DocumentReference? userRef;
  final DocumentReference? gameRef;

  @override
  State<GameToRentWidget> createState() => _GameToRentWidgetState();
}

class _GameToRentWidgetState extends State<GameToRentWidget> {
  late GameToRentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameToRentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAME_TO_RENT_gameToRent_ON_INIT_STATE');
      logFirebaseEvent('gameToRent_backend_call');
      _model.userObject = await UsersRecord.getDocumentOnce(widget!.userRef!);
      logFirebaseEvent('gameToRent_custom_action');
      _model.distanceCalculated = await actions.distanceBetween2Points(
        currentUserDocument!.address.lat,
        currentUserDocument!.address.lng,
        _model.userObject!.address.lat,
        _model.userObject!.address.lng,
      );
      logFirebaseEvent('gameToRent_firestore_query');
      _model.myGamesObject = await queryMyGamesRecordOnce(
        parent: widget!.userRef,
        queryBuilder: (myGamesRecord) => myGamesRecord.where(
          'gameRef',
          isEqualTo: widget!.gameRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('gameToRent_backend_call');
      _model.authUserObject =
          await UsersRecord.getDocumentOnce(currentUserReference!);
      logFirebaseEvent('gameToRent_custom_action');
      _model.quotationJson = await actions.getQuotationLalaMove(
        _model.userObject!.address.lat.toString(),
        _model.userObject!.address.lng.toString(),
        currentUserDocument!.address.lat.toString(),
        currentUserDocument!.address.lng.toString(),
        '${_model.userObject?.address?.street}, ${_model.userObject?.address?.number} , ${_model.userObject?.address?.complement}- ${_model.userObject?.address?.neighborhood} , ${_model.userObject?.address?.city}${_model.userObject?.address?.state}',
        '${currentUserDocument?.address?.street}, ${currentUserDocument?.address?.number} , ${currentUserDocument?.address?.complement}- ${currentUserDocument?.address?.neighborhood} , ${currentUserDocument?.address?.city}${currentUserDocument?.address?.state}',
      );
      logFirebaseEvent('gameToRent_update_component_state');
      _model.isLoaded = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 176.0,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Builder(
              builder: (context) {
                if (_model.isLoaded) {
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Distância',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Text(
                                    'Rating do locador',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.attach_money_outlined,
                                            color: Color(0xFF0E9E43),
                                            size: 16.0,
                                          ),
                                          Text(
                                            'Valor diária',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.attach_money_outlined,
                                            color: Color(0xFF0E9E43),
                                            size: 16.0,
                                          ),
                                          Text(
                                            'Valor Entrega',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: RatingBarIndicator(
                                        itemBuilder: (context, index) => FaIcon(
                                          FontAwesomeIcons.mapMarkerAlt,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                        direction: Axis.horizontal,
                                        rating: _model.distanceCalculated!,
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        itemCount: 5,
                                        itemSize: 18.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        direction: Axis.horizontal,
                                        rating: valueOrDefault<double>(
                                          _model.userObject?.rating != null
                                              ? _model.userObject?.rating
                                              : 0.0,
                                          0.0,
                                        ),
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        itemCount: 5,
                                        itemSize: 18.0,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              _model.myGamesObject?.price,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.commaDecimal,
                                              currency: 'R\$',
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        Text(
                                          'R\$${valueOrDefault<String>(
                                            getJsonField(
                                              _model.quotationJson,
                                              r'''$.data.priceBreakdown.total''',
                                            )?.toString(),
                                            '0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'GAME_TO_RENT_ESCOLHER_DATAS_BTN_ON_TAP');
                                  logFirebaseEvent('Button_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: CalendarChooseDateRentWidget(
                                              availableDates: _model
                                                  .myGamesObject!
                                                  .availableDates,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                text: 'Escolher datas',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
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
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: custom_widgets.LoadingIndicator(
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
