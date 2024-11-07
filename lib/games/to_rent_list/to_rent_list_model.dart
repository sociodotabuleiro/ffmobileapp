import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'to_rent_list_widget.dart' show ToRentListWidget;
import 'package:flutter/material.dart';

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

  String? orderId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? renterObject;
  // Stores action output result for [Backend Call - API (createBillingCard)] action in Button widget.
  ApiCallResponse? createdBillingcard;
  // Stores action output result for [Backend Call - API (paymentStatus)] action in Button widget.
  ApiCallResponse? paymentstatuscard;
  // Stores action output result for [Backend Call - API (createBillingPix)] action in Button widget.
  ApiCallResponse? createdBillingPix;
  // Stores action output result for [Backend Call - API (paymentStatus)] action in Button widget.
  ApiCallResponse? paymentstatuspix;
  // Stores action output result for [Custom Action - callDriverLalamove] action in Button widget.
  dynamic lalamoveCallRequest;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RentalsRecord? documentRenting;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RentalsRecord? documentOwner;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersRentalRecord? usersRentalObject;
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
