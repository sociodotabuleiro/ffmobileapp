import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/gamelist_card/gamelist_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_games_widget.dart' show MyGamesWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyGamesModel extends FlutterFlowModel<MyGamesWidget> {
  ///  Local state fields for this page.

  int currentIndexFavorites = 0;

  int finalIndexFavoriites = 0;

  List<GamesRecord> favoritedGamesDocList = [];
  void addToFavoritedGamesDocList(GamesRecord item) =>
      favoritedGamesDocList.add(item);
  void removeFromFavoritedGamesDocList(GamesRecord item) =>
      favoritedGamesDocList.remove(item);
  void removeAtIndexFromFavoritedGamesDocList(int index) =>
      favoritedGamesDocList.removeAt(index);
  void insertAtIndexInFavoritedGamesDocList(int index, GamesRecord item) =>
      favoritedGamesDocList.insert(index, item);
  void updateFavoritedGamesDocListAtIndex(
          int index, Function(GamesRecord) updateFn) =>
      favoritedGamesDocList[index] = updateFn(favoritedGamesDocList[index]);

  List<String> favoritedGamesNames = [];
  void addToFavoritedGamesNames(String item) => favoritedGamesNames.add(item);
  void removeFromFavoritedGamesNames(String item) =>
      favoritedGamesNames.remove(item);
  void removeAtIndexFromFavoritedGamesNames(int index) =>
      favoritedGamesNames.removeAt(index);
  void insertAtIndexInFavoritedGamesNames(int index, String item) =>
      favoritedGamesNames.insert(index, item);
  void updateFavoritedGamesNamesAtIndex(int index, Function(String) updateFn) =>
      favoritedGamesNames[index] = updateFn(favoritedGamesNames[index]);

  int currentIndexWishlist = 0;

  int finalIndexWishlist = 0;

  List<DocumentReference> wishlistGamesDocList = [];
  void addToWishlistGamesDocList(DocumentReference item) =>
      wishlistGamesDocList.add(item);
  void removeFromWishlistGamesDocList(DocumentReference item) =>
      wishlistGamesDocList.remove(item);
  void removeAtIndexFromWishlistGamesDocList(int index) =>
      wishlistGamesDocList.removeAt(index);
  void insertAtIndexInWishlistGamesDocList(int index, DocumentReference item) =>
      wishlistGamesDocList.insert(index, item);
  void updateWishlistGamesDocListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      wishlistGamesDocList[index] = updateFn(wishlistGamesDocList[index]);

  List<String> wishlistGamesNames = [];
  void addToWishlistGamesNames(String item) => wishlistGamesNames.add(item);
  void removeFromWishlistGamesNames(String item) =>
      wishlistGamesNames.remove(item);
  void removeAtIndexFromWishlistGamesNames(int index) =>
      wishlistGamesNames.removeAt(index);
  void insertAtIndexInWishlistGamesNames(int index, String item) =>
      wishlistGamesNames.insert(index, item);
  void updateWishlistGamesNamesAtIndex(int index, Function(String) updateFn) =>
      wishlistGamesNames[index] = updateFn(wishlistGamesNames[index]);

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

  // Stores action output result for [Backend Call - Read Document] action in Tab widget.
  GamesRecord? gamesDocument;
  // Stores action output result for [Backend Call - Read Document] action in Tab widget.
  GamesRecord? gamesDocumentWishlist;
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
