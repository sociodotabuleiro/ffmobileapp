import 'package:flutter/foundation.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/games/modify_my_game_price/modify_my_game_price_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_game_config_sheet_model.dart';
export 'my_game_config_sheet_model.dart';

class MyGameConfigSheetWidget extends StatefulWidget {
  const MyGameConfigSheetWidget({
    super.key,
    required this.gameRef,
    required this.gameName,
    this.myGameRef,
  });

  final DocumentReference? gameRef;
  final String? gameName;
  final DocumentReference? myGameRef;

  @override
  State<MyGameConfigSheetWidget> createState() =>
      _MyGameConfigSheetWidgetState();
}

class _MyGameConfigSheetWidgetState extends State<MyGameConfigSheetWidget> {
  late MyGameConfigSheetModel _model;
  Future<void> shareGameUri() async {
    // Ensure `gameName` is not null, providing a default empty string if needed
    final String gameName = widget.gameName ?? '';
    final String encodedGameName = Uri.encodeComponent(gameName);

    // Create the URI for deep linking
    final String uri = 'com.sociodotabuleiro.app://jogos/$encodedGameName';

    // Share the URI
    await Share.share(uri);
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyGameConfigSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_GAME_CONFIG_SHEET_myGameConfig_O');
      logFirebaseEvent('myGameConfigSheet_backend_call');
      if (widget.myGameRef != null) {
        _model.myGamesObject =
            await MyGamesRecord.getDocumentOnce(widget.myGameRef!);
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
    if (kDebugMode) {
      print(widget.gameRef);
    }
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MY_GAME_CONFIG_SHEET_Container_hvddqqe5_');
                  logFirebaseEvent('Container_share');
                  // Construct URI using the custom scheme

                  await shareGameUri(); // Share the URI with other apps
                },
                child: _buildOptionRow(
                  context,
                  icon: Icons.share_rounded,
                  text: 'Compartilhar',
                ),
              ),
            ),
            if ((_model.myGamesObject?.toRent == true) &&
                (FFAppState().myGamesGameRef.contains(widget.gameRef)))
              InkWell(
                onTap: () {
                  logFirebaseEvent('MY_GAME_CONFIG_SHEET_modify_dates');
                  // Call your modify dates method or show relevant widget
                },
                child: _buildOptionRow(
                  context,
                  icon: Icons.calendar_today,
                  text: 'Modificar datas disponíveis',
                ),
              ),
            if ((_model.myGamesObject?.toRent == true) &&
                (FFAppState().myGamesGameRef.contains(widget.gameRef)))
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MY_GAME_CONFIG_SHEET_Container_kay1quct_');
                  logFirebaseEvent('Container_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            child: ModifyMyGamePriceWidget(
                              myGameObject: _model.myGamesObject!,
                            ),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: _buildOptionRow(
                context,
                icon: Icons.attach_money,
                text: 'Modificar valor do aluguel',
              ),
          )],
        ),
      ),
    );
  }
  Widget _buildOptionRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).primaryBackground,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  text,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelLargeFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).labelLargeFamily),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}