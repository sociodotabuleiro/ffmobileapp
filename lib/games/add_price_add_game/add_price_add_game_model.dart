import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/text_field_game_price/text_field_game_price_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_price_add_game_widget.dart' show AddPriceAddGameWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MyGamesRecord? myGameDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
