import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_card_widget.dart' show CartCardWidget;
import 'package:flutter/material.dart';

class CartCardModel extends FlutterFlowModel<CartCardWidget> {
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

  // Stores action output result for [Backend Call - Read Document] action in cartCard widget.
  GamesRecord? gameByRef;
  // Stores action output result for [Custom Action - filterByGeoHash] action in cartCard widget.
  List<DocumentReference>? filteredGeoHash;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
