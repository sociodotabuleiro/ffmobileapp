import '/flutter_flow/flutter_flow_util.dart';
import 'add_price_add_game_widget.dart' show AddPriceAddGameWidget;
import 'package:flutter/material.dart';

class AddPriceAddGameModel extends FlutterFlowModel<AddPriceAddGameWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> disponiveisAlugar = [];
  void addToDisponiveisAlugar(DocumentReference item) =>
      disponiveisAlugar.add(item);
  void removeFromDisponiveisAlugar(DocumentReference item) =>
      disponiveisAlugar.remove(item);
  void removeAtIndexFromDisponiveisAlugar(int index) =>
      disponiveisAlugar.removeAt(index);
  void insertAtIndexInDisponiveisAlugar(int index, DocumentReference item) =>
      disponiveisAlugar.insert(index, item);
  void updateDisponiveisAlugarAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      disponiveisAlugar[index] = updateFn(disponiveisAlugar[index]);

  List<double> valorDisponiveisAlugar = [];
  void addToValorDisponiveisAlugar(double item) =>
      valorDisponiveisAlugar.add(item);
  void removeFromValorDisponiveisAlugar(double item) =>
      valorDisponiveisAlugar.remove(item);
  void removeAtIndexFromValorDisponiveisAlugar(int index) =>
      valorDisponiveisAlugar.removeAt(index);
  void insertAtIndexInValorDisponiveisAlugar(int index, double item) =>
      valorDisponiveisAlugar.insert(index, item);
  void updateValorDisponiveisAlugarAtIndex(
          int index, Function(double) updateFn) =>
      valorDisponiveisAlugar[index] = updateFn(valorDisponiveisAlugar[index]);

  int currentCount = 0;

  int finalCount = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<DocumentReference, bool> checkboxValueMap = {};
  List<DocumentReference> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
