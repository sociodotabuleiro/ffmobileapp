import 'dart:ui';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:calendar_iagfh0/custom_code/widgets/index.dart'
    as calendar_iagfh0_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'calendar_choose_date_rent_model.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';

import '../../custom_code/widgets/custom_time_picker.dart';

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
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isTimeSelected = false;

  DateTime?  _selectedDate;


  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarChooseDateRentModel());

    _model.availableDates = widget.availableDates ?? [];

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<List<DateTime>> fetchLatestAvailableDates() async {

      try {
      // Get the mygames document reference
      final myGamesDocRef = widget.renterRef!.collection('myGames').doc(widget.myGames!.reference.id);

      // Fetch the document snapshot
      final myGamesDocSnapshot = await myGamesDocRef.get();

      // Check if the document exists
      if (!myGamesDocSnapshot.exists) {
        logFirebaseEvent('mygames_document_not_found');
        return [];
      }

      // Get the availableDates array
    final List<dynamic>? availableDatesRaw =
        myGamesDocSnapshot.data()?['availableDates'] as List<dynamic>?;

    // Convert the dates to DateTime objects and return
    return availableDatesRaw
            ?.map((date) => (date as Timestamp).toDate())
            .toList() ??
        [];
  } catch (e) {
    if (e is FirebaseException) {
      print('Fi-rebase error: ${e.code}'); 
    }
    logFirebaseEvent('Error fetching available dates');
    return [];
  }
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
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25.0, 35.0, 0.0, 0.0),
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
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: calendar_iagfh0_custom_widgets.Calendar(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.8,
              availableDates: _model.availableDates,
              onSelectedDatesChanged: (choosenDates) async {
                _model.choosenDates = choosenDates!.toList().cast<DateTime>();
                safeSetState(() {});
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 20.0,
          ),
          if (_isTimeSelected == true) 
              SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 40.0,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Horário de entrega selecionado: ${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 100.0,
            child:  StatefulBuilder(
              builder: (context, setState) {
              return GameToRentWidget(
                  gameName: widget.gameName,
                  gameRef: widget.myGames!.gameRef,
                  userRef: widget.renterRef,
                  allowCalendarIcon: false,
                  selectedDate: _model.choosenDates.isNotEmpty
                      ? _model.choosenDates.first
                      : null,
                  selectedTime: _selectedTime,
                );
              },
            ),
          ),
          const Spacer(), // Pushes the buttons to the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('OPEN_TIME_PICKER_MODAL');
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: CustomTimePicker(
                                initialTime: _selectedTime,
                                onTimeChanged: (TimeOfDay newTime) {
                                  setState(() {
                                    _selectedTime = newTime;
                                    _isTimeSelected = true;
                                  });
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: 'Escolher horário',
                  options: FFButtonOptions(
                    height: 40.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('calendar_choose_date_rent_confirm_BTN');
                    // Confirm the selection and save data
                    FFAppState().choosenRentDates =
                        _model.choosenDates.toList().cast<DateTime>();
                    FFAppState().renterRef = widget.renterRef;
                    FFAppState().purchaseData = PurchaseComponentsStruct(
                      name: widget.gameName,
                      price: _model.choosenDates.length * widget.myGames!.price,
                      quantity: 1,
                      totalPrice: _model.choosenDates.length * widget.myGames!.price,
                    );
                    FFAppState().dueDatePurchase = _model.choosenDates.last;
                    // Pop back to the previous page
                    Navigator.pop(context);
                  },
                  text: 'Confirmar',
                  options: FFButtonOptions(
                    height: 40.0,
                    color: Colors.green,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
