import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/add_price_add_game/add_price_add_game_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'confirm_add_games_model.dart';
export 'confirm_add_games_model.dart';

class ConfirmAddGamesWidget extends StatefulWidget {
  const ConfirmAddGamesWidget({
    super.key,
    required this.choosenGames,
  });

  final List<DocumentReference>? choosenGames;

  @override
  State<ConfirmAddGamesWidget> createState() => _ConfirmAddGamesWidgetState();
}

class _ConfirmAddGamesWidgetState extends State<ConfirmAddGamesWidget> {
  late ConfirmAddGamesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmAddGamesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONFIRM_ADD_GAMES_confirmAddGames_ON_INI');
      logFirebaseEvent('confirmAddGames_update_component_state');
      _model.finalIndex = widget!.choosenGames?.length;
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
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
            child: Text(
              'Deseja realmente adicionar os seguintes jogos?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.45,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final gamesList = widget!.choosenGames!.toList();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(gamesList.length, (gamesListIndex) {
                        final gamesListItem = gamesList[gamesListIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FutureBuilder<GamesRecord>(
                            future: GamesRecord.getDocumentOnce(gamesListItem),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final containerGamesRecord = snapshot.data!;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  containerGamesRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              );
                            },
                          ),
                        );
                      }).divide(SizedBox(height: 2.0)),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CONFIRM_ADD_GAMES_CANCELAR_BTN_ON_TAP');
                  logFirebaseEvent('Button_close_dialog_drawer_etc');
                  Navigator.pop(context);
                },
                text: 'Cancelar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                  logFirebaseEvent('CONFIRM_ADD_GAMES_ADICIONAR_BTN_ON_TAP');
                  logFirebaseEvent('Button_update_app_state');
                  FFAppState().gamesToAdd = [];
                  safeSetState(() {});
                  while (_model.currentIndex! < _model.finalIndex!) {
                    logFirebaseEvent('Button_backend_call');
                    _model.document = await GamesRecord.getDocumentOnce(
                        widget!.choosenGames![_model.currentIndex!]);
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().addToGamesToAdd(GameToAddStruct(
                      gameRef: widget!.choosenGames?[_model.currentIndex!],
                      rentValue: valueOrDefault<double>(
                        _model.document!.averagePrice * 0.03,
                        0.0,
                      ),
                      isAvailableToRent: FFAppConstants.cities2Rent.contains(
                              functions.normalizeString(
                                  currentUserDocument!.address.city)) ==
                          true,
                    ));
                    safeSetState(() {});
                    logFirebaseEvent('Button_update_component_state');
                    _model.currentIndex = _model.currentIndex! + 1;
                    safeSetState(() {});
                  }
                  logFirebaseEvent('Button_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: AddPriceAddGameWidget(
                              games: widget!.choosenGames!,
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));

                  safeSetState(() {});
                },
                text: 'Adicionar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
        ],
      ),
    );
  }
}
