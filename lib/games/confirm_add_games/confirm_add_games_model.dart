import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_add_games_widget.dart' show ConfirmAddGamesWidget;
import 'package:flutter/material.dart';

class ConfirmAddGamesModel extends FlutterFlowModel<ConfirmAddGamesWidget> {
  ///  Local state fields for this component.

  int? currentIndex = 0;

  int? finalIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GamesRecord? document;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
