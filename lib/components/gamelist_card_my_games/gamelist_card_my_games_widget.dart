import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'gamelist_card_my_games_model.dart';
export 'gamelist_card_my_games_model.dart';

class GamelistCardMyGamesWidget extends StatefulWidget {
  const GamelistCardMyGamesWidget({
    super.key,
    this.gameObject,
    this.gameRef,
    this.myGameRef,
  });

  final GamesRecord? gameObject;
  final DocumentReference? gameRef;
  final DocumentReference? myGameRef;

  @override
  State<GamelistCardMyGamesWidget> createState() =>
      _GamelistCardMyGamesWidgetState();
}

class _GamelistCardMyGamesWidgetState extends State<GamelistCardMyGamesWidget> {
  late GamelistCardMyGamesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamelistCardMyGamesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAMELIST_CARD_MY_GAMES_gamelistCardMyGam');
      if (widget!.gameRef != null) {
        logFirebaseEvent('gamelistCardMyGames_backend_call');
        _model.gameByRef = await GamesRecord.getDocumentOnce(widget!.gameRef!);
        logFirebaseEvent('gamelistCardMyGames_update_component_sta');
        _model.gameObject = _model.gameByRef;
        _model.gamePicUrl = _model.gameByRef?.thumbnailUrl;
        _model.gameName = _model.gameByRef?.name;
        _model.gameDescription = _model.gameByRef?.description;
        _model.gamePrice = _model.gameByRef?.averagePrice;
        _model.gameRating = _model.gameByRef?.rating;
        _model.playersCount = _model.gameByRef?.playerCountMax?.toString();
        _model.playtime = _model.gameByRef?.playTime?.toString();
        _model.ageRecommendation =
            _model.gameByRef?.ageRecommendation?.toString();
        safeSetState(() {});
      } else {
        logFirebaseEvent('gamelistCardMyGames_update_component_sta');
        _model.gameObject = widget!.gameObject;
        _model.gamePicUrl = widget!.gameObject?.thumbnailUrl;
        _model.gameName = widget!.gameObject?.name;
        _model.gameDescription = widget!.gameObject?.description;
        _model.gamePrice = widget!.gameObject?.averagePrice;
        _model.gameRating = widget!.gameObject?.rating;
        _model.playersCount = widget!.gameObject?.playerCountMax?.toString();
        _model.playtime = widget!.gameObject?.playTime?.toString();
        _model.ageRecommendation =
            widget!.gameObject?.ageRecommendation?.toString();
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
    return StreamBuilder<MyGamesRecord>(
      stream: MyGamesRecord.getDocument(widget!.myGameRef!),
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

        final containerMyGamesRecord = snapshot.data!;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('GAMELIST_CARD_MY_GAMES_Container_73hwouo');
            logFirebaseEvent('Container_navigate_to');

            context.pushNamed(
              'gameDetails',
              pathParameters: {
                'gameName': serializeParam(
                  _model.gameName,
                  ParamType.String,
                ),
              }.withoutNulls,
              queryParameters: {
                'gameObject': serializeParam(
                  _model.gameObject,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'gameObject': _model.gameObject,
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.22,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: _model.gamePicUrl!,
                            width: MediaQuery.sizeOf(context).width * 0.25,
                            height: 75.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 80.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      _model.gameName,
                                      'Nome do Jogo',
                                    ).maybeHandleOverflow(
                                      maxChars: 35,
                                      replacement: '…',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '${containerMyGamesRecord.price.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.gameDescription,
                                          'Descrição do Jogo',
                                        ).maybeHandleOverflow(
                                          maxChars: 25,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 4.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            _model.gameRating,
                                            formatType: FormatType.decimal,
                                            decimalType:
                                                DecimalType.periodDecimal,
                                          ),
                                          '0.0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.users,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.playersCount,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.clock,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.playtime,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.child_care,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 16.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              '${_model.ageRecommendation} anos',
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        indent: 25.0,
                        endIndent: 25.0,
                        color: FlutterFlowTheme.of(context).secondary,
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
  }
}
