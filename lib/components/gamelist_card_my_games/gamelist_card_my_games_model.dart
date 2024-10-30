import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'gamelist_card_my_games_widget.dart' show GamelistCardMyGamesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

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
