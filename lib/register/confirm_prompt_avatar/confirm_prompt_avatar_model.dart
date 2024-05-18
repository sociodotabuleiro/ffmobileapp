import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_prompt_avatar_widget.dart' show ConfirmPromptAvatarWidget;
import 'package:flutter/material.dart';

class ConfirmPromptAvatarModel
    extends FlutterFlowModel<ConfirmPromptAvatarWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getImageOpenAi)] action in Button widget.
  ApiCallResponse? imageCallResult;
  // Stores action output result for [Custom Action - downloadPictureAndSaveInFirebaseStorage] action in Button widget.
  String? storageURL;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
