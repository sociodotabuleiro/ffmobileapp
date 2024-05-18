import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'filters_model.dart';
export 'filters_model.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({
    super.key,
    bool? parameter1,
    required this.parameter2,
    bool? parameter3,
    required this.parameter4,
  })  : parameter1 = parameter1 ?? false,
        parameter3 = parameter3 ?? false;

  final bool parameter1;
  final int? parameter2;
  final bool parameter3;
  final int? parameter4;

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  late FiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.05,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 35.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child:
                        // order type: 0 = Cresc
                        //                          1 =  Decresc
                        Visibility(
                      visible: (widget.parameter1 == false) ||
                          (widget.parameter2 == 0),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.sortAlphaUp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 35.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (widget.parameter1 == true) &&
                          (widget.parameter2 == 1),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.sortAlphaDownAlt,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 35.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (widget.parameter3 == false) ||
                          (widget.parameter4 == 0),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.sortNumericUp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 35.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (widget.parameter3 == true) &&
                          (widget.parameter4 == 0),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.sortNumericDownAlt,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
