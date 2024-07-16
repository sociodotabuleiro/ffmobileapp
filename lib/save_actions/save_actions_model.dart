import '/flutter_flow/flutter_flow_util.dart';
import 'save_actions_widget.dart' show SaveActionsWidget;
import 'package:flutter/material.dart';

class SaveActionsModel extends FlutterFlowModel<SaveActionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
