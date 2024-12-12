import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/text_field_game_price/text_field_game_price_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_price_add_game_model.dart';
export 'add_price_add_game_model.dart';

class AddPriceAddGameWidget extends StatefulWidget {
  const AddPriceAddGameWidget({
    super.key,
    required this.games,
  });

  final List<DocumentReference>? games;

  @override
  State<AddPriceAddGameWidget> createState() => _AddPriceAddGameWidgetState();
}

class _AddPriceAddGameWidgetState extends State<AddPriceAddGameWidget> {
  late AddPriceAddGameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPriceAddGameModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADD_PRICE_ADD_GAME_addPriceAddGame_ON_IN');
      logFirebaseEvent('addPriceAddGame_update_component_state');
      _model.finalCount = widget!.games!.length;
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
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.95,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.15,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                child: Text(
                  'Adicione seus valores, caso o jogo esteja disponível para alugar',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.6,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final gamesList = widget!.games!.toList();

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(gamesList.length, (gamesListIndex) {
                            final gamesListItem = gamesList[gamesListIndex];
                            return FutureBuilder<GamesRecord>(
                              future:
                                  GamesRecord.getDocumentOnce(gamesListItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final containerGamesRecord = snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          containerGamesRecord.name,
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
                                        if (FFAppConstants.cities2Rent.contains(
                                                functions.normalizeString(
                                                    currentUserDocument!
                                                        .address.city)) ==
                                            true)
                                          AuthUserStreamWidget(
                                            builder: (context) => Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model.checkboxValueMap[
                                                            gamesListItem] ??= FFAppConstants
                                                                .cities2Rent
                                                                .contains(functions.normalizeString(
                                                                    currentUserDocument!
                                                                        .address
                                                                        .city)) ==
                                                            true,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValueMap[
                                                                      gamesListItem] =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            logFirebaseEvent(
                                                                'ADD_PRICE_ADD_GAME_Checkbox_tqepitd9_ON_');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_app_state');
                                                            FFAppState()
                                                                .updateGamesToAddAtIndex(
                                                              gamesListIndex,
                                                              (e) => e
                                                                ..isAvailableToRent =
                                                                    true,
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            logFirebaseEvent(
                                                                'ADD_PRICE_ADD_GAME_Checkbox_tqepitd9_ON_');
                                                            logFirebaseEvent(
                                                                'Checkbox_update_app_state');
                                                            FFAppState()
                                                                .updateGamesToAddAtIndex(
                                                              gamesListIndex,
                                                              (e) => e
                                                                ..isAvailableToRent =
                                                                    false,
                                                            );
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Disponível para alugar',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: 200.0,
                                                  decoration: BoxDecoration(),
                                                  child:
                                                      TextFieldGamePriceWidget(
                                                    key: Key(
                                                        'Key6g3_${gamesListIndex}_of_${gamesList.length}'),
                                                    gameToAdd: FFAppState()
                                                        .gamesToAdd
                                                        .elementAtOrNull(
                                                            gamesListIndex)!,
                                                    indexGameToAdd:
                                                        gamesListIndex,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }).divide(SizedBox(height: 25.0)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.15,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_PRICE_ADD_GAME_CANCELAR_BTN_ON_TAP');
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  text: 'Cancelar',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).error,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('ADD_PRICE_ADD_GAME_FINALIZAR_BTN_ON_TAP');
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      while (_model.currentCount < _model.finalCount) {
                        logFirebaseEvent('Button_backend_call');

                        var myGamesRecordReference =
                            MyGamesRecord.createDoc(currentUserReference!);
                        firestoreBatch.set(myGamesRecordReference, {
                          ...createMyGamesRecordData(
                            gameRef: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.gameRef,
                            price: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.rentValue,
                            toRent: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.isAvailableToRent,
                            publicId:
                                '${FFAppState().gamesToAdd.elementAtOrNull(_model.currentCount)?.gameRef?.id}${random_data.randomString(
                              5,
                              5,
                              true,
                              true,
                              true,
                            )}',
                          ),
                          ...mapToFirestore(
                            {
                              'availableDates': functions
                                  .createListofDateTime30DaysFromToday(),
                            },
                          ),
                        });
                        _model.myGameDocument =
                            MyGamesRecord.getDocumentFromData({
                          ...createMyGamesRecordData(
                            gameRef: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.gameRef,
                            price: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.rentValue,
                            toRent: FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.isAvailableToRent,
                            publicId:
                                '${FFAppState().gamesToAdd.elementAtOrNull(_model.currentCount)?.gameRef?.id}${random_data.randomString(
                              5,
                              5,
                              true,
                              true,
                              true,
                            )}',
                          ),
                          ...mapToFirestore(
                            {
                              'availableDates': functions
                                  .createListofDateTime30DaysFromToday(),
                            },
                          ),
                        }, myGamesRecordReference);
                        if (FFAppState()
                                .gamesToAdd
                                .elementAtOrNull(_model.currentCount)
                                ?.isAvailableToRent ==
                            true) {
                          logFirebaseEvent('Button_backend_call');

                          firestoreBatch.update(
                              FFAppState()
                                  .gamesToAdd
                                  .elementAtOrNull(_model.currentCount)!
                                  .gameRef!,
                              {
                                ...createGamesRecordData(
                                  availableToRent: true,
                                ),
                                ...mapToFirestore(
                                  {
                                    'quantityAvailable':
                                        FieldValue.increment(1),
                                    'availableAt': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                    'availableAtGeoHash':
                                        FieldValue.arrayUnion([
                                      valueOrDefault<String>(
                                        currentUserDocument?.address?.geohash,
                                        '0',
                                      )
                                    ]),
                                    'availableAtLatLng': FieldValue.arrayUnion([
                                      currentUserDocument?.address?.coordinates
                                          ?.toGeoPoint()
                                    ]),
                                    'availableAtMyGamesRef':
                                        FieldValue.arrayUnion(
                                            [_model.myGameDocument?.reference]),
                                  },
                                ),
                              });
                        }
                        logFirebaseEvent('Button_update_component_state');
                        _model.currentCount = _model.currentCount + 1;
                        safeSetState(() {});
                      }
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text('Sucesso!'),
                              content: Text(
                                  'Seus jogos foram adicionados com sucesso!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().gamesToAdd = [];
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('AddGames');
                    } finally {
                      await firestoreBatch.commit();
                    }

                    safeSetState(() {});
                  },
                  text: 'Finalizar',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF24965B),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
