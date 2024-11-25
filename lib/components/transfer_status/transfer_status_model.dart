import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transfer_status_widget.dart' show TransferStatusWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransferStatusModel extends FlutterFlowModel<TransferStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in transferStatus widget.
  UsersRecord? ownerObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
