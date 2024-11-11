import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gamelist_card_model.dart';
export 'gamelist_card_model.dart';

class GamelistCardWidget extends StatefulWidget {
  const GamelistCardWidget({
    super.key,
    this.gameObject,
    this.gameRef,
  });

  final GamesRecord? gameObject;
  final DocumentReference? gameRef;

  @override
  State<GamelistCardWidget> createState() => _GamelistCardWidgetState();
}

class _GamelistCardWidgetState extends State<GamelistCardWidget> {
  late GamelistCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamelistCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAMELIST_CARD_gamelistCard_ON_INIT_STATE');
      if (widget!.gameRef != null) {
        logFirebaseEvent('gamelistCard_backend_call');
        _model.gameByRef = await GamesRecord.getDocumentOnce(widget!.gameRef!);
        logFirebaseEvent('gamelistCard_update_component_state');
        _model.gameObject = _model.gameByRef;
        _model.gamePicUrl = _model.gameByRef?.thumbnailUrl;
        _model.gameName = _model.gameByRef?.name;
        _model.gameDescription = _model.gameByRef?.description;
        _model.gamePrice = _model.gameByRef?.averagePrice;
        _model.gameRating = _model.gameByRef?.rating;
        _model.playersCount = _model.gameByRef?.playerCountMax.toString();
        _model.playtime = _model.gameByRef?.playTime.toString();
        _model.ageRecommendation =
            _model.gameByRef?.ageRecommendation.toString();
        safeSetState(() {});
      } else {
        logFirebaseEvent('gamelistCard_update_component_state');
        _model.gameObject = widget.gameObject;
        _model.gamePicUrl = widget.gameObject?.thumbnailUrl;
        _model.gameName = widget.gameObject?.name;
        _model.gameDescription = widget.gameObject?.description;
        _model.gamePrice = widget.gameObject?.averagePrice;
        _model.gameRating = widget.gameObject?.rating;
        _model.playersCount = widget.gameObject?.playerCountMax.toString();
        _model.playtime = widget.gameObject?.playTime.toString();
        _model.ageRecommendation =
            widget.gameObject?.ageRecommendation.toString();
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('GAMELIST_CARD_Container_ifknx6wx_ON_TAP');
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
        height: 190.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ].divide(const SizedBox(width: 32.0)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(28.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: _model.gamePicUrl != null
                              ? CachedNetworkImage(
                                  fadeInDuration: const Duration(milliseconds: 500),
                                  fadeOutDuration: const Duration(milliseconds: 500),
                                  imageUrl: _model.gamePicUrl!,
                                  width: MediaQuery.sizeOf(context).width * 0.25,
                                  height: 75.0,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(0.0, 0.0),
                                )
                              : Container(
                                  width: MediaQuery.sizeOf(context).width * 0.25,
                                  height: 75.0,
                                  color: Colors.grey[300], // Placeholder background color
                                  child: Center(
                                    child: Icon(
                                      Icons.image, // Placeholder icon
                                      color: Colors.grey[600],
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 280.0,
                        height: 70.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.gameDescription,
                              'Descrição do Jogo',
                            ).maybeHandleOverflow(
                              maxChars: 140,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 12.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 45.0,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
