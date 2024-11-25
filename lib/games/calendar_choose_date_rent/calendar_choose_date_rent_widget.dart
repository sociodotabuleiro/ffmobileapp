import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:calendar_iagfh0/custom_code/widgets/index.dart'
    as calendar_iagfh0_custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_choose_date_rent_model.dart';
export 'calendar_choose_date_rent_model.dart';

class CalendarChooseDateRentWidget extends StatefulWidget {
  const CalendarChooseDateRentWidget({
    super.key,
    required this.availableDates,
    required this.renterRef,
    required this.myGames,
    required this.gameName,
  });

  final List<DateTime>? availableDates;
  final DocumentReference? renterRef;
  final MyGamesRecord? myGames;
  final String? gameName;

  @override
  State<CalendarChooseDateRentWidget> createState() =>
      _CalendarChooseDateRentWidgetState();
}

class _CalendarChooseDateRentWidgetState
    extends State<CalendarChooseDateRentWidget> {
  late CalendarChooseDateRentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarChooseDateRentModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CALENDAR_CHOOSE_DATE_RENT_arrow_back_ICN');
                  logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: calendar_iagfh0_custom_widgets.Calendar(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.8,
              availableDates: widget!.availableDates!,
              onSelectedDatesChanged: (choosenDates) async {
                logFirebaseEvent('CALENDAR_CHOOSE_DATE_RENT_Container_5d3u');
                logFirebaseEvent('Calendar_update_component_state');
                _model.choosenDates = choosenDates!.toList().cast<DateTime>();
                safeSetState(() {});
              },
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('CALENDAR_CHOOSE_DATE_RENT_ESCOLHER_LOCAD');
              logFirebaseEvent('Button_update_app_state');
              FFAppState().choosenRentDates =
                  _model.choosenDates.toList().cast<DateTime>();
              FFAppState().renterRef = widget!.renterRef;
              FFAppState().purchaseData = PurchaseComponentsStruct(
                name: widget!.gameName,
                price: _model.choosenDates.length * widget!.myGames!.price,
                quantity: 1,
                totalPrice: _model.choosenDates.length * widget!.myGames!.price,
              );
              FFAppState().dueDatePurchase = _model.choosenDates.last;
              safeSetState(() {});
            },
            text: 'Escolher locador',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
