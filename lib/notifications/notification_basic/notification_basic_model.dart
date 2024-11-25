import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_basic_widget.dart' show NotificationBasicWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationBasicModel extends FlutterFlowModel<NotificationBasicWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in notification_basic widget.
  NotificationsRecord? notificationObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
