import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_card_model.dart';
export 'cart_card_model.dart';

class CartCardWidget extends StatefulWidget {
  const CartCardWidget({
    super.key,
    this.gameObject,
    this.gameRef,
  });

  final GamesRecord? gameObject;
  final DocumentReference? gameRef;

  @override
  State<CartCardWidget> createState() => _CartCardWidgetState();
}

class _CartCardWidgetState extends State<CartCardWidget> {
  late CartCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CART_CARD_COMP_cartCard_ON_INIT_STATE');
      if (widget.gameRef != null) {
        logFirebaseEvent('cartCard_backend_call');
        _model.gameByRef = await GamesRecord.getDocumentOnce(widget.gameRef!);
        logFirebaseEvent('cartCard_custom_action');
        _model.filteredGeoHash = await actions.filterByGeoHash(
          context,
          currentUserDocument!.address.coordinates!,
          15000.0,
          widget.gameObject!,
        );
        logFirebaseEvent('cartCard_update_component_state');
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
        setState(() {});
      } else {
        logFirebaseEvent('cartCard_update_component_state');
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
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        logFirebaseEvent('CART_CARD_COMP_Container_azf0ibgc_ON_TAP');
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
        height: 230.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 500),
                      fadeOutDuration: const Duration(milliseconds: 500),
                      imageUrl: _model.gamePicUrl!,
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: 75.0,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          _model.gameName,
                          'Nome do Jogo',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            formatNumber(
                              _model.gamePrice,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.commaDecimal,
                              currency: 'R\$',
                            ),
                            '99',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleLargeFamily,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleLargeFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: FlutterFlowTheme.of(context).success,
                              size: 16.0,
                            ),
                            Text(
                              valueOrDefault<String>(
                                _model.gameByRef?.availableAt.length
                                    .toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              'disponíveis',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.filteredGeoHash!.isNotEmpty)
                              Icon(
                                Icons.place_outlined,
                                color: _model.filteredGeoHash!.isNotEmpty
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).error,
                                size: 16.0,
                              ),
                            if (_model.filteredGeoHash!.isEmpty)
                              Icon(
                                Icons.wrong_location_outlined,
                                color: _model.filteredGeoHash!.isNotEmpty
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).error,
                                size: 16.0,
                              ),
                            Text(
                              valueOrDefault<String>(
                                _model.filteredGeoHash?.length.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Text(
                              'locadores disponíveis num raio de 15km',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
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
              ].divide(const SizedBox(height: 8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
