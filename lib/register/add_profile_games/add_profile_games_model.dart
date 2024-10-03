import '/flutter_flow/flutter_flow_util.dart';
import 'add_profile_games_widget.dart' show AddProfileGamesWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddProfileGamesModel extends FlutterFlowModel<AddProfileGamesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthTextController;
  final dateOfBirthMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateOfBirthTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dateOfBirthFocusNode?.dispose();
    dateOfBirthTextController?.dispose();
  }
}
