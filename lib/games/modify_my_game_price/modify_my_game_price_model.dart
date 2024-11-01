import '/flutter_flow/flutter_flow_util.dart';
import 'modify_my_game_price_widget.dart' show ModifyMyGamePriceWidget;
import 'package:flutter/material.dart';

class ModifyMyGamePriceModel extends FlutterFlowModel<ModifyMyGamePriceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
