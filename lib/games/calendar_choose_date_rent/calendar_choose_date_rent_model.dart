import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'calendar_choose_date_rent_widget.dart'
    show CalendarChooseDateRentWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:calendar_iagfh0/custom_code/widgets/index.dart'
    as calendar_iagfh0_custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarChooseDateRentModel
    extends FlutterFlowModel<CalendarChooseDateRentWidget> {
  ///  Local state fields for this component.

  List<DateTime> choosenDates = [];
  void addToChoosenDates(DateTime item) => choosenDates.add(item);
  void removeFromChoosenDates(DateTime item) => choosenDates.remove(item);
  void removeAtIndexFromChoosenDates(int index) => choosenDates.removeAt(index);
  void insertAtIndexInChoosenDates(int index, DateTime item) =>
      choosenDates.insert(index, item);
  void updateChoosenDatesAtIndex(int index, Function(DateTime) updateFn) =>
      choosenDates[index] = updateFn(choosenDates[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
