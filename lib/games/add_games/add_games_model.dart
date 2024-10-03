import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_games_widget.dart' show AddGamesWidget;
import 'package:flutter/material.dart';

class AddGamesModel extends FlutterFlowModel<AddGamesWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> markedGames = [];
  void addToMarkedGames(DocumentReference item) => markedGames.add(item);
  void removeFromMarkedGames(DocumentReference item) =>
      markedGames.remove(item);
  void removeAtIndexFromMarkedGames(int index) => markedGames.removeAt(index);
  void insertAtIndexInMarkedGames(int index, DocumentReference item) =>
      markedGames.insert(index, item);
  void updateMarkedGamesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      markedGames[index] = updateFn(markedGames[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - searchGameLists] action in TextField widget.
  List<DocumentReference>? searchedGamesList;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  Map<DocumentReference, bool> checkboxValueMap = {};
  List<DocumentReference> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
