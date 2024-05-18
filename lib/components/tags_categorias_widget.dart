import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tags_categorias_model.dart';
export 'tags_categorias_model.dart';

class TagsCategoriasWidget extends StatefulWidget {
  const TagsCategoriasWidget({
    super.key,
    required this.category,
    required this.color,
  });

  final String? category;
  final Color? color;

  @override
  State<TagsCategoriasWidget> createState() => _TagsCategoriasWidgetState();
}

class _TagsCategoriasWidgetState extends State<TagsCategoriasWidget>
    with TickerProviderStateMixin {
  late TagsCategoriasModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsCategoriasModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: Container(
              height: 32.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.color,
                  const Color(0x7226062B),
                ),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: valueOrDefault<Color>(
                    widget.color,
                    FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.category,
                      'Categoria',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
          ),
        ]
            .divide(const SizedBox(width: 8.0))
            .addToStart(const SizedBox(width: 16.0))
            .addToEnd(const SizedBox(width: 16.0)),
      ),
    ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!);
  }
}
