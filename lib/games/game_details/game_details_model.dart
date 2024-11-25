import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/my_game_config_sheet/my_game_config_sheet_widget.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'game_details_widget.dart' show GameDetailsWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GameDetailsModel extends FlutterFlowModel<GameDetailsWidget> {
  ///  Local state fields for this page.

  List<String> categories = [];
  void addToCategories(String item) => categories.add(item);
  void removeFromCategories(String item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, String item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(int index, Function(String) updateFn) =>
      categories[index] = updateFn(categories[index]);

  bool lerMais = false;

  bool favorited = false;

  bool wishlisted = false;

  DocumentReference? myGameRef;

  int timesFavorited = 0;

  int timesWishlisted = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getMyGamesRefFromGamesId] action in Icon widget.
  DocumentReference? myGamesRef;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
