import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/game_to_rent/game_to_rent_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'to_rent_list_widget.dart' show ToRentListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ToRentListModel extends FlutterFlowModel<ToRentListWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> userList = [];
  void addToUserList(UsersRecord item) => userList.add(item);
  void removeFromUserList(UsersRecord item) => userList.remove(item);
  void removeAtIndexFromUserList(int index) => userList.removeAt(index);
  void insertAtIndexInUserList(int index, UsersRecord item) =>
      userList.insert(index, item);
  void updateUserListAtIndex(int index, Function(UsersRecord) updateFn) =>
      userList[index] = updateFn(userList[index]);

  List<MyGamesRecord> myGamesList = [];
  void addToMyGamesList(MyGamesRecord item) => myGamesList.add(item);
  void removeFromMyGamesList(MyGamesRecord item) => myGamesList.remove(item);
  void removeAtIndexFromMyGamesList(int index) => myGamesList.removeAt(index);
  void insertAtIndexInMyGamesList(int index, MyGamesRecord item) =>
      myGamesList.insert(index, item);
  void updateMyGamesListAtIndex(int index, Function(MyGamesRecord) updateFn) =>
      myGamesList[index] = updateFn(myGamesList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (createBillingCard)] action in Button widget.
  ApiCallResponse? createdBillingcard;
  // Stores action output result for [Backend Call - API (paymentStatus)] action in Button widget.
  ApiCallResponse? paymentstatuscard;
  // Stores action output result for [Backend Call - API (createBillingPix)] action in Button widget.
  ApiCallResponse? createdBillingPix;
  // Stores action output result for [Backend Call - API (paymentStatus)] action in Button widget.
  ApiCallResponse? paymentstatuspix;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
