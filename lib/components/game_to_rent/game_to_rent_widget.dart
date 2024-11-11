import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/games/calendar_choose_date_rent/calendar_choose_date_rent_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    required this.gameName,
  });

  final DocumentReference? userRef;
  final DocumentReference? gameRef;
  final String? gameName;

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
      _model.userObject = await UsersRecord.getDocumentOnce(widget.userRef!);
      logFirebaseEvent('gameToRent_update_component_state');
      _model.quotation = QuotationsStruct(
        renterRef: _model.userObject?.reference,
      );
      safeSetState(() {});
      logFirebaseEvent('gameToRent_custom_action');
      _model.distanceCalculated = await actions.distanceBetween2Points(
        currentUserDocument!.address.lat,
        currentUserDocument!.address.lng,
        _model.userObject!.address.lat,
        _model.userObject!.address.lng,
      );
      logFirebaseEvent('gameToRent_firestore_query');
      _model.myGamesObject = await queryMyGamesRecordOnce(
        parent: widget.userRef,
        queryBuilder: (myGamesRecord) => myGamesRecord.where(
          'gameRef',
          isEqualTo: widget.gameRef,
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
        '${_model.userObject?.address.street}, ${_model.userObject?.address.number} , ${_model.userObject?.address.complement}- ${_model.userObject?.address.neighborhood} , ${_model.userObject?.address.city}${_model.userObject?.address.state}',
        '${currentUserDocument?.address.street}, ${currentUserDocument?.address.number} , ${currentUserDocument?.address.complement}- ${currentUserDocument?.address.neighborhood} , ${currentUserDocument?.address.city}${currentUserDocument?.address.state}',
      );
      if ((LalamoveQuotationDataStruct.maybeFromMap(_model.quotationJson!)!
                  .priceBreakdown
                  .total <=
              0.0) &&
          !_model.quotationJson!) {
        logFirebaseEvent('gameToRent_update_component_state');
        _model.quotationSuccess = false;
        safeSetState(() {});
      } else {
        logFirebaseEvent('gameToRent_update_component_state');
        _model.isLoaded = true;
        _model.updateQuotationStruct(
          (e) => e
            ..quotationsData =
                LalamoveQuotationDataStruct.maybeFromMap(_model.quotationJson),
        );
        safeSetState(() {});
        logFirebaseEvent('gameToRent_update_app_state');
        FFAppState().addToQuotations(QuotationsStruct(
          renterRef: widget.userRef,
          quotationsData:
              LalamoveQuotationDataStruct.maybeFromMap(_model.quotationJson),
        ));
        safeSetState(() {});
      }
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
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      height: 96.0,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 0.1,
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.0, -1.0),
        child: Builder(
          builder: (context) {
            if (_model.isLoaded) {
              return Builder(
                builder: (context) {
                  if (_model.quotationSuccess ?? false) {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/977/600',
                                          width: 45.0,
                                          height: 45.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    if (_model.userObject?.isStore == true)
                                      Text(
                                        _model.userObject!.firstName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    RatingBarIndicator(
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: valueOrDefault<double>(
                                        _model.userObject?.rating ?? 0.0,
                                        0.0,
                                      ),
                                      unratedColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      itemCount: 5,
                                      itemSize: 18.0,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.attach_money_outlined,
                                          color: Color(0xFF0E9E43),
                                          size: 16.0,
                                        ),
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
                                                color: const Color(0xFF0E9E43),
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
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Icon(
                                          Icons.motorcycle_sharp,
                                          color: Color(0xFF0E9E43),
                                          size: 16.0,
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
                                                color: const Color(0xFF0E9E43),
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
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ].divide(const SizedBox(height: 5.0)),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'GAME_TO_RENT_Container_xihcs5uz_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child:
                                                    CalendarChooseDateRentWidget(
                                                  availableDates: _model
                                                      .myGamesObject!
                                                      .availableDates,
                                                  renterRef: widget.userRef!,
                                                  myGames:
                                                      _model.myGamesObject!,
                                                  gameName: widget.gameName!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 115.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.calendar_month,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 44.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'Escolher datas',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(width: 12.0))
                                  .addToStart(const SizedBox(width: 4.0))
                                  .addToEnd(const SizedBox(width: 4.0)),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://picsum.photos/seed/977/600',
                                          width: 45.0,
                                          height: 45.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    if (_model.userObject?.isStore == true)
                                      Text(
                                        _model.userObject!.firstName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    RatingBarIndicator(
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: valueOrDefault<double>(
                                        _model.userObject?.rating ?? 0.0,
                                        0.0,
                                      ),
                                      unratedColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      itemCount: 5,
                                      itemSize: 18.0,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Não foi possível quotar a entrega',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Text(
                                      'Tente novamente mais tarde',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ],
                                ),
                              ]
                                  .divide(const SizedBox(width: 12.0))
                                  .addToStart(const SizedBox(width: 4.0))
                                  .addToEnd(const SizedBox(width: 4.0)),
                            ),
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    );
                  }
                },
              );
            } else {
              return const Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
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
    );
  }
}
