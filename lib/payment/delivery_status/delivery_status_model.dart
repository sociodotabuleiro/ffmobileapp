import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/transfer_status/transfer_status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delivery_status_widget.dart' show DeliveryStatusWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class DeliveryStatusModel extends FlutterFlowModel<DeliveryStatusWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, RentalsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    navBarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, RentalsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, RentalsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, RentalsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryRentalsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 2,
          isStream: true,
        ),
      );
  }
}
