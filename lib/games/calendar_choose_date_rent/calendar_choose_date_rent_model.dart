import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_choose_date_rent_widget.dart'
    show CalendarChooseDateRentWidget;
import 'package:flutter/material.dart';

class CalendarChooseDateRentModel
    extends FlutterFlowModel<CalendarChooseDateRentWidget> {
  ///  Local state fields for this component.

  List<DateTime> choosenDates = [];

  List<DateTime> availableDates = [];
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
