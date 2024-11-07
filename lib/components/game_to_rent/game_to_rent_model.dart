import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/calendar_choose_date_rent/calendar_choose_date_rent_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'game_to_rent_widget.dart' show GameToRentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GameToRentModel extends FlutterFlowModel<GameToRentWidget> {
  ///  Local state fields for this component.

  List<DateTime> datasDisponiveis = [];
  void addToDatasDisponiveis(DateTime item) => datasDisponiveis.add(item);
  void removeFromDatasDisponiveis(DateTime item) =>
      datasDisponiveis.remove(item);
  void removeAtIndexFromDatasDisponiveis(int index) =>
      datasDisponiveis.removeAt(index);
  void insertAtIndexInDatasDisponiveis(int index, DateTime item) =>
      datasDisponiveis.insert(index, item);
  void updateDatasDisponiveisAtIndex(int index, Function(DateTime) updateFn) =>
      datasDisponiveis[index] = updateFn(datasDisponiveis[index]);

  double? totalPrice = 0.0;

  bool isLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in gameToRent widget.
  UsersRecord? userObject;
  // Stores action output result for [Custom Action - distanceBetween2Points] action in gameToRent widget.
  double? distanceCalculated;
  // Stores action output result for [Firestore Query - Query a collection] action in gameToRent widget.
  MyGamesRecord? myGamesObject;
  // Stores action output result for [Backend Call - Read Document] action in gameToRent widget.
  UsersRecord? authUserObject;
  // Stores action output result for [Custom Action - getQuotationLalaMove] action in gameToRent widget.
  dynamic quotationJson;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
