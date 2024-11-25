import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'game_list_admin_widget.dart' show GameListAdminWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class GameListAdminModel extends FlutterFlowModel<GameListAdminWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  GamesRecord? gameView;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Custom Action - searchGameLists] action in IconButton widget.
  List<DocumentReference>? searchedList;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, GamesRecord>? listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for playerCount widget.
  FocusNode? playerCountFocusNode;
  TextEditingController? playerCountTextController;
  String? Function(BuildContext, String?)? playerCountTextControllerValidator;
  // State field(s) for playTime widget.
  FocusNode? playTimeFocusNode;
  TextEditingController? playTimeTextController;
  String? Function(BuildContext, String?)? playTimeTextControllerValidator;
  // State field(s) for ageRecommendation widget.
  FocusNode? ageRecommendationFocusNode;
  TextEditingController? ageRecommendationTextController;
  String? Function(BuildContext, String?)?
      ageRecommendationTextControllerValidator;
  // State field(s) for averagePrice widget.
  FocusNode? averagePriceFocusNode;
  TextEditingController? averagePriceTextController;
  String? Function(BuildContext, String?)? averagePriceTextControllerValidator;
  // State field(s) for rating widget.
  FocusNode? ratingFocusNode;
  TextEditingController? ratingTextController;
  String? Function(BuildContext, String?)? ratingTextControllerValidator;
  // State field(s) for bggRating widget.
  FocusNode? bggRatingFocusNode;
  TextEditingController? bggRatingTextController;
  String? Function(BuildContext, String?)? bggRatingTextControllerValidator;
  // State field(s) for bggRanking widget.
  FocusNode? bggRankingFocusNode;
  TextEditingController? bggRankingTextController;
  String? Function(BuildContext, String?)? bggRankingTextControllerValidator;
  // State field(s) for bggWeight widget.
  FocusNode? bggWeightFocusNode;
  TextEditingController? bggWeightTextController;
  String? Function(BuildContext, String?)? bggWeightTextControllerValidator;
  // State field(s) for width widget.
  FocusNode? widthFocusNode;
  TextEditingController? widthTextController;
  String? Function(BuildContext, String?)? widthTextControllerValidator;
  // State field(s) for length widget.
  FocusNode? lengthFocusNode;
  TextEditingController? lengthTextController;
  String? Function(BuildContext, String?)? lengthTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    tabBarController?.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    playerCountFocusNode?.dispose();
    playerCountTextController?.dispose();

    playTimeFocusNode?.dispose();
    playTimeTextController?.dispose();

    ageRecommendationFocusNode?.dispose();
    ageRecommendationTextController?.dispose();

    averagePriceFocusNode?.dispose();
    averagePriceTextController?.dispose();

    ratingFocusNode?.dispose();
    ratingTextController?.dispose();

    bggRatingFocusNode?.dispose();
    bggRatingTextController?.dispose();

    bggRankingFocusNode?.dispose();
    bggRankingTextController?.dispose();

    bggWeightFocusNode?.dispose();
    bggWeightTextController?.dispose();

    widthFocusNode?.dispose();
    widthTextController?.dispose();

    lengthFocusNode?.dispose();
    lengthTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, GamesRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, GamesRecord> _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, GamesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGamesRecordPage(
          queryBuilder: (_) => listViewPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
