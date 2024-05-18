import '/components/game_to_rent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'to_rent_list_widget.dart' show ToRentListWidget;
import 'package:flutter/material.dart';

class ToRentListModel extends FlutterFlowModel<ToRentListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - filterByGeoHash] action in toRentList widget.
  List<DocumentReference>? searchedList;
  // Model for gameToRent component.
  late GameToRentModel gameToRentModel;

  @override
  void initState(BuildContext context) {
    gameToRentModel = createModel(context, () => GameToRentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    gameToRentModel.dispose();
  }
}
