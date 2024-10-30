import '/backend/backend.dart';
import '/components/gamelist_card/gamelist_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/search_filter/search_filter_widget.dart';
import '/components/side_nav02/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'games_list_widget.dart' show GamesListWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GamesListModel extends FlutterFlowModel<GamesListWidget> {
  ///  Local state fields for this page.

  bool sortAlph = false;

  int sortAlphType = 0;

  bool sortPrice = false;

  int sortPriceType = 0;

  ///  State fields for stateful widgets in this page.

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
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, GamesRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

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
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();

    navBarModel.dispose();
    sideNav02Model.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, GamesRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, GamesRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, GamesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryGamesRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
