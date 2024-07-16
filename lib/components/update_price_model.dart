import '/flutter_flow/flutter_flow_util.dart';
import 'update_price_widget.dart' show UpdatePriceWidget;
import 'package:flutter/material.dart';

class UpdatePriceModel extends FlutterFlowModel<UpdatePriceWidget> {
  ///  State fields for stateful widgets in this component.

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
