import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gamelist_card_my_games_widget.dart' show GamelistCardMyGamesWidget;
import 'package:flutter/material.dart';

class GamelistCardMyGamesModel
    extends FlutterFlowModel<GamelistCardMyGamesWidget> {
  ///  Local state fields for this component.

  GamesRecord? gameObject;

  String? gamePicUrl;

  String? gameName;

  String? gameDescription;

  double? gamePrice;

  double? gameRating;

  String? playersCount;

  String? playtime;

  String? ageRecommendation;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in gamelistCardMyGames widget.
  GamesRecord? gameByRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
