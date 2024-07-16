import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'to_rent_list_widget.dart' show ToRentListWidget;
import 'package:flutter/material.dart';

class ToRentListModel extends FlutterFlowModel<ToRentListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - filterByGeoHash] action in toRentList widget.
  List<DocumentReference>? searchedList;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }
}
