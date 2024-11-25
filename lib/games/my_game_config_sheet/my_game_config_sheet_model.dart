import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/games/modify_my_game_price/modify_my_game_price_widget.dart';
import 'my_game_config_sheet_widget.dart' show MyGameConfigSheetWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyGameConfigSheetModel extends FlutterFlowModel<MyGameConfigSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in myGameConfigSheet widget.
  MyGamesRecord? myGamesObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
