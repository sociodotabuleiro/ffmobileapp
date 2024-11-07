import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'game_to_rent_widget.dart' show GameToRentWidget;
import 'package:flutter/material.dart';

class GameToRentModel extends FlutterFlowModel<GameToRentWidget> {
  ///  Local state fields for this component.

  List<DateTime> datasDisponiveis = [];
  void addToDatasDisponiveis(DateTime item) => datasDisponiveis.add(item);
  void removeFromDatasDisponiveis(DateTime item) =>
      datasDisponiveis.remove(item);
  void removeAtIndexFromDatasDisponiveis(int index) =>
      datasDisponiveis.removeAt(index);
  void insertAtIndexInDatasDisponiveis(int index, DateTime item) =>
      datasDisponiveis.insert(index, item);
  void updateDatasDisponiveisAtIndex(int index, Function(DateTime) updateFn) =>
      datasDisponiveis[index] = updateFn(datasDisponiveis[index]);

  double? totalPrice = 0.0;

  bool isLoaded = false;

  QuotationsStruct? quotation;
  void updateQuotationStruct(Function(QuotationsStruct) updateFn) {
    updateFn(quotation ??= QuotationsStruct());
  }

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
  dynamic quotationJson;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
