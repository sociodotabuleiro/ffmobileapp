import '/components/nav_bar_widget.dart';
import '/components/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'games_list_widget.dart' show GamesListWidget;
import 'package:flutter/material.dart';

class GamesListModel extends FlutterFlowModel<GamesListWidget> {
  ///  Local state fields for this page.

  bool sortAlph = false;

  int sortAlphType = 0;

  bool sortPrice = false;

  int sortPriceType = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchGameLists] action in TextField widget.
  List<DocumentReference>? searchedGamesList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for SideNav02 component.
  late SideNav02Model sideNav02Model;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    sideNav02Model = createModel(context, () => SideNav02Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
    sideNav02Model.dispose();
  }
}
