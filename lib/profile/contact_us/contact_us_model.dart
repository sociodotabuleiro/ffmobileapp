import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contact_us_widget.dart' show ContactUsWidget;
import 'package:flutter/material.dart';

class ContactUsModel extends FlutterFlowModel<ContactUsWidget> {
  ///  Local state fields for this component.

  int messageCharCount = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for titleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  String? _titleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Por favor digite um tópico';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for messageField widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;
  String? _messageFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 30) {
      return 'Por favor digite uma mensagem';
    }
    if (val.length > 300) {
      return 'Por favor digite até 300 caracteres';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    titleFieldTextControllerValidator = _titleFieldTextControllerValidator;
    messageFieldTextControllerValidator = _messageFieldTextControllerValidator;
  }

  @override
  void dispose() {
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();
  }
}
