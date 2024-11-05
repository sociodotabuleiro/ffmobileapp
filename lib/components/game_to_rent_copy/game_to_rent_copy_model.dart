import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'game_to_rent_copy_widget.dart' show GameToRentCopyWidget;
import 'package:flutter/material.dart';

class GameToRentCopyModel extends FlutterFlowModel<GameToRentCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in gameToRentCopy widget.
  UsersRecord? user;
  // Stores action output result for [Firestore Query - Query a collection] action in gameToRentCopy widget.
  MyGamesRecord? game2rent;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
