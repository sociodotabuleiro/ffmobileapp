import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_to_rent_copy_model.dart';
export 'game_to_rent_copy_model.dart';

class GameToRentCopyWidget extends StatefulWidget {
  const GameToRentCopyWidget({
    super.key,
    required this.userRef,
    required this.gameRef,
  });

  final DocumentReference? userRef;
  final DocumentReference? gameRef;

  @override
  State<GameToRentCopyWidget> createState() => _GameToRentCopyWidgetState();
}

class _GameToRentCopyWidgetState extends State<GameToRentCopyWidget> {
  late GameToRentCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameToRentCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAME_TO_RENT_COPY_gameToRentCopy_ON_INIT');
      logFirebaseEvent('gameToRentCopy_backend_call');
      _model.user = (await UsersRecord.getDocumentOnce(widget.userRef!)) as UsersRecord?;
      logFirebaseEvent('gameToRentCopy_firestore_query');
      _model.game2rent = await queryMyGamesRecordOnce(
        parent: widget.userRef,
        queryBuilder: (myGamesRecord) => myGamesRecord.where(
          'gameRef',
          isEqualTo: widget.gameRef,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
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
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
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
                                  'Rating do locador',
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
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: RatingBarIndicator(
                                      itemBuilder: (context, index) => FaIcon(
                                        FontAwesomeIcons.locationDot,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: 3.0,
                                      unratedColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      itemCount: 5,
                                      itemSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: RatingBarIndicator(
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: valueOrDefault<double>(
                                        _model.user?.rating,
                                        0.0,
                                      ),
                                      unratedColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      itemCount: 5,
                                      itemSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Datas Disponíveis',
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
                                SizedBox(
                                  width: 200.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController1 ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue1 ??= '',
                                        ),
                                        options: List<String>.from(
                                            _model.game2rent!.availableDates
                                                .map((e) => dateTimeFormat(
                                                      "d/M/y",
                                                      e,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ))
                                                .toList()),
                                        optionLabels: _model
                                            .game2rent!.availableDates
                                            .map((e) => dateTimeFormat(
                                                  "MMMEd",
                                                  e,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ))
                                            .toList(),
                                        onChanged: (val) => safeSetState(
                                            () => _model.dropDownValue1 = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 40.0,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                        hintText: 'Data inicial',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.dropDownValue1 != null &&
                                              _model.dropDownValue1 != '') {
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController2 ??=
                                                  FormFieldController<String>(
                                                _model.dropDownValue2 ??= '',
                                              ),
                                              options: List<String>.from(
                                                  functions
                                                      .getOnlyLaterDates(
                                                          _model.game2rent!
                                                              .availableDates
                                                              .toList(),
                                                          _model
                                                              .dropDownValue1!)!
                                                      .map(
                                                          (e) => valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  "d/M/y",
                                                                  e,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                'Escolha primeira data',
                                                              ))
                                                      .toList()),
                                              optionLabels: functions
                                                  .getOnlyLaterDates(
                                                      _model.game2rent!
                                                          .availableDates
                                                          .toList(),
                                                      _model.dropDownValue1!)!
                                                  .map((e) =>
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "MMMEd",
                                                          e,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        'Escolha primeira data',
                                                      ))
                                                  .toList(),
                                              onChanged: (val) => safeSetState(
                                                  () => _model.dropDownValue2 =
                                                      val),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              hintText: 'Data final',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          } else {
                                            return Text(
                                              'Escolha uma data inicial',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        if ((_model.dropDownValue1 != null &&
                                _model.dropDownValue1 != '') &&
                            (_model.dropDownValue2 != null &&
                                _model.dropDownValue2 != '')) {
                          return
                              // Price * days
                              Text(
                            valueOrDefault<String>(
                              formatNumber(
                                functions.priceForDays(
                                    _model.dropDownValue1!,
                                    _model.dropDownValue2!,
                                    _model.game2rent!.price),
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.commaDecimal,
                                currency: 'R\$',
                              ),
                              '0',
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          );
                        } else {
                          return Text(
                            'Valores diárias',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          );
                        }
                      },
                    ),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 16.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        FFAppConstants.entrega.toString(),
                        '10',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    SizedBox(
                      width: 80.0,
                      child: Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    Text(
                      formatNumber(
                        (_model.dropDownValue1 != null &&
                                    _model.dropDownValue1 != '') &&
                                (_model.dropDownValue2 != null &&
                                    _model.dropDownValue2 != '')
                            ? (functions.priceForDays(
                                    _model.dropDownValue1!,
                                    _model.dropDownValue2!,
                                    _model.game2rent!.price) +
                                FFAppConstants.entrega)
                            : FFAppConstants.entrega,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.commaDecimal,
                        currency: 'R\$',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).success,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
