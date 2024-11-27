import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rent_request_widget.dart' show RentRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RentRequestModel extends FlutterFlowModel<RentRequestWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in rentRequest widget.
  GamesRecord? gameObject;
  // Stores action output result for [Backend Call - Read Document] action in rentRequest widget.
  UsersRecord? rentingUserObject;
  // Stores action output result for [Firestore Query - Query a collection] action in rentRequest widget.
  RentalsRecord? rentalsObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
