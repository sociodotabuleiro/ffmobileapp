import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 500.0,
                  child: custom_widgets.Calendar(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 500.0,
                    availableDates: FFAppState().datesAvailable,
                    onSelectedDatesChanged: (choosenDates) async {
                      _model.choosenDates =
                          choosenDates!.toList().cast<DateTime>();
                      safeSetState(() {});
                    },
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (_model.choosenDates.isNotEmpty) {
                    return Builder(
                      builder: (context) {
                        final choosenDatesList = _model.choosenDates.toList();

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(choosenDatesList.length,
                                (choosenDatesListIndex) {
                              final choosenDatesListItem =
                                  choosenDatesList[choosenDatesListIndex];
                              return Text(
                                dateTimeFormat("MMMEd", choosenDatesListItem),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              );
                            }).divide(SizedBox(height: 8.0)),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text(
                      'Sem datas',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
