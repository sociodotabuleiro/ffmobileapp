import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/side_nav02/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (createClientAsaas)] action in HomePage widget.
  ApiCallResponse? apiResultpfd;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<GamesRecord>? featuredGamesMocked;
  // Stores action output result for [Backend Call - API (insertOrRetrieveToken)] action in HomePage widget.
  ApiCallResponse? apiResult37t;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

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
    navBarModel.dispose();
    sideNav02Model.dispose();
  }
}
