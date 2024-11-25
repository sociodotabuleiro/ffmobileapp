import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_game_price_model.dart';
export 'text_field_game_price_model.dart';

class TextFieldGamePriceWidget extends StatefulWidget {
  const TextFieldGamePriceWidget({
    super.key,
    required this.gameToAdd,
    required this.indexGameToAdd,
  });

  final GameToAddStruct? gameToAdd;
  final int? indexGameToAdd;

  @override
  State<TextFieldGamePriceWidget> createState() =>
      _TextFieldGamePriceWidgetState();
}

class _TextFieldGamePriceWidgetState extends State<TextFieldGamePriceWidget> {
  late TextFieldGamePriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldGamePriceModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        logFirebaseEvent('TEXT_FIELD_GAME_PRICE_TextField_qpi4dcf4');
        if (_model.textController.text != null &&
            _model.textController.text != '') {
          logFirebaseEvent('TextField_update_app_state');
          FFAppState().updateGamesToAddAtIndex(
            widget!.indexGameToAdd!,
            (e) => e
              ..rentValue =
                  functions.stringToDouble(_model.textController.text),
          );
          safeSetState(() {});
        } else {
          return;
        }
      },
    );
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
      width: 200.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 2000),
            () async {
              logFirebaseEvent('TEXT_FIELD_GAME_PRICE_TextField_qpi4dcf4');
              if (_model.textController.text != null &&
                  _model.textController.text != '') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().updateGamesToAddAtIndex(
                  widget!.indexGameToAdd!,
                  (e) => e
                    ..rentValue =
                        functions.stringToDouble(_model.textController.text),
                );
                safeSetState(() {});
              } else {
                return;
              }
            },
          ),
          onFieldSubmitted: (_) async {
            logFirebaseEvent('TEXT_FIELD_GAME_PRICE_TextField_qpi4dcf4');
            if (_model.textController.text != null &&
                _model.textController.text != '') {
              logFirebaseEvent('TextField_update_app_state');
              FFAppState().updateGamesToAddAtIndex(
                widget!.indexGameToAdd!,
                (e) => e
                  ..rentValue =
                      functions.stringToDouble(_model.textController.text),
              );
              safeSetState(() {});
            } else {
              return;
            }
          },
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Valor diária',
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            hintText: valueOrDefault<String>(
              formatNumber(
                FFAppState().gamesToAdd[widget!.indexGameToAdd!].rentValue,
                formatType: FormatType.decimal,
                decimalType: DecimalType.commaDecimal,
                currency: 'R\$',
              ),
              '0',
            ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                  lineHeight: 2.0,
                ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
