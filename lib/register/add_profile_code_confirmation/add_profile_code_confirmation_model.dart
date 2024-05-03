import '/flutter_flow/flutter_flow_util.dart';
import 'add_profile_code_confirmation_widget.dart'
    show AddProfileCodeConfirmationWidget;
import 'package:flutter/material.dart';

class AddProfileCodeConfirmationModel
    extends FlutterFlowModel<AddProfileCodeConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
