import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import 'confirm_prompt_avatar_widget.dart' show ConfirmPromptAvatarWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
