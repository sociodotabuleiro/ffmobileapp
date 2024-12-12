import '/backend/backend.dart';
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


  bool isLoaded = false;

  QuotationsStruct? quotation;
  void updateQuotationStruct(Function(QuotationsStruct) updateFn) {
    updateFn(quotation ??= QuotationsStruct());
  }

    // Safely parse numeric strings to double
  double safeParseDouble(String? value) {
    return double.tryParse(value ?? '0') ?? 0.0;
  }

  bool? quotationSuccess;

  ///  State fields for stateful widgets in this component.

  

  // Stores action output result for [Backend Call - Read Document] action in gameToRent widget.
  UsersRecord? userObject;
  // Stores action output result for [Custom Action - distanceBetween2Points] action in gameToRent widget.
  double? distanceCalculated;
  // Stores action output result for [Firestore Query - Query a collection] action in gameToRent widget.
  MyGamesRecord? myGamesObject;
  // Stores action output result for [Backend Call - Read Document] action in gameToRent widget.
  UsersRecord? authUserObject;
  // Stores action output result for [Custom Action - getQuotationLalaMove] action in gameToRent widget.
  dynamic? quotationJson;

  bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true; // Null check
  }
  if (value is String) {
    return value.trim().isEmpty; // Check if String is empty
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty; // Check if List, Set, or Map is empty
  }
  return false; // Not null and not empty
}

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
