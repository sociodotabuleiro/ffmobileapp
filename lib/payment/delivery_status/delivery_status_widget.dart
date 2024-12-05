import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/transfer_status/transfer_status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'delivery_status_model.dart';
export 'delivery_status_model.dart';

class DeliveryStatusWidget extends StatefulWidget {
  /// this page should have a list of all the current rent requests, informing
  /// the state of the actve rents and separating them from the past requests
  const DeliveryStatusWidget({super.key});

  @override
  State<DeliveryStatusWidget> createState() => _DeliveryStatusWidgetState();
}

class _DeliveryStatusWidgetState extends State<DeliveryStatusWidget> {
  late DeliveryStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryStatusModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'deliveryStatus'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'deliveryStatus',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('DELIVERY_STATUS_arrow_back_rounded_ICN_O');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Pedidos',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          RentalsRecord>.separated(
                        pagingController: _model.setListViewController(
                            RentalsRecord.collection(currentUserReference)
                                .orderBy('currentStatusTime', descending: true),
                            parent: currentUserReference),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                        builderDelegate:
                            PagedChildBuilderDelegate<RentalsRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewRentalsRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 290.0,
                              decoration: const BoxDecoration(),
                              child: TransferStatusWidget(
                                key: Key(
                                    'Key68d_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                rental: listViewRentalsRecord,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const NavBarWidget(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
