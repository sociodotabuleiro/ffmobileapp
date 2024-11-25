import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/add_price_add_game/add_price_add_game_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'confirm_add_games_widget.dart' show ConfirmAddGamesWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ConfirmAddGamesModel extends FlutterFlowModel<ConfirmAddGamesWidget> {
  ///  Local state fields for this component.

  int? currentIndex = 0;

  int? finalIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GamesRecord? document;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
