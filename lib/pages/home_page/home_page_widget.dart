import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/side_nav02/side_nav02_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import '/auth/get_fcm_token.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

     // Check and add FCM token
    _initializeFcmToken();

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});


    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      if (!(valueOrDefault(currentUserDocument?.asaasClientId, '') != null &&
          valueOrDefault(currentUserDocument?.asaasClientId, '') != '')) {
        logFirebaseEvent('HomePage_backend_call');
        unawaited(
          () async {
            _model.apiResultpfd = await CreateClientAsaasCall.call(
              name: valueOrDefault(currentUserDocument?.fullName, ''),
              cpfCnpj: valueOrDefault(currentUserDocument?.cpf, ''),
              email: currentUserEmail,
              mobilePhone: currentPhoneNumber,
              address: currentUserDocument?.address?.street,
              addressNumber: currentUserDocument?.address?.number,
              province: currentUserDocument?.address?.neighborhood,
              postalCode: currentUserDocument?.address?.zip,
              externalReference: currentUserReference?.id,
            );
          }(),
        );
      }
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().firstSessionlogin = false;
      FFAppState().userAddress =
          '${currentUserDocument?.address?.street}, ${currentUserDocument?.address?.number}';
      FFAppState().userAddressLatLng =
          currentUserDocument?.address?.coordinates;
      safeSetState(() {});
      logFirebaseEvent('HomePage_firestore_query');
      _model.featuredGamesMocked = await queryGamesRecordOnce(
        queryBuilder: (gamesRecord) => gamesRecord.where(
          'bggRating',
          isGreaterThan: 7.0,
        ),
        limit: 5,
      );
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().featuredGames = _model.featuredGamesMocked!
          .map((e) => e.reference)
          .toList()
          .toList()
          .cast<DocumentReference>();
      safeSetState(() {});
      if (((currentUserDocument?.favoriteUsers?.toList() ?? []).isNotEmpty) ==
          true) {
        // setFollowingUsers
        logFirebaseEvent('HomePage_setFollowingUsers');
        FFAppState().followingUsers =
            (currentUserDocument?.favoriteUsers?.toList() ?? [])
                .toList()
                .cast<DocumentReference>();
        safeSetState(() {});
      }
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().firstSessionlogin = false;
      safeSetState(() {});
      if ((FFAppState().myGamesId.isNotEmpty) == false) {
        logFirebaseEvent('HomePage_update_app_state');
        FFAppState().deleteMyGamesId();
        FFAppState().myGamesId = [];

        FFAppState().deleteMyGamesGameRef();
        FFAppState().myGamesGameRef = [];

        safeSetState(() {});
        logFirebaseEvent('HomePage_custom_action');
        await actions.fetchMyGames(
          context,
          currentUserReference!,
        );
      }
      if (((currentUserDocument?.wishlist?.toList() ?? []).isNotEmpty) ==
          true) {
        // updateWishlist
        logFirebaseEvent('HomePage_updateWishlist');
        FFAppState().wishlist = (currentUserDocument?.wishlist?.toList() ?? [])
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      }
      if (((currentUserDocument?.favoriteList?.toList() ?? []).isNotEmpty) ==
          true) {
        // updateFavoriteList
        logFirebaseEvent('HomePage_updateFavoriteList');
        FFAppState().favoritedGames =
            (currentUserDocument?.favoriteList?.toList() ?? [])
                .toList()
                .cast<DocumentReference>();
        safeSetState(() {});
      }
      if ((valueOrDefault<bool>(currentUserDocument?.askedToRentTo, false) ==
              null) ||
          (valueOrDefault<bool>(currentUserDocument?.askedToRentTo, false) ==
              false)) {
        logFirebaseEvent('HomePage_alert_dialog');
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text('Confirmação de aluguel'),
                    content: Text('Você deseja alugar seu acervo de jogos?'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Não'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Claro, vamos nessa!'),
                      ),
                    ],
                  ),
                );
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          logFirebaseEvent('HomePage_backend_call');
          _model.apiResult37t = await InsertOrRetrieveTokenCall.call(
            userReference: currentUserReference?.id,
            action: 'insert',
          );

          if ((_model.apiResult37t?.succeeded ?? true)) {
            logFirebaseEvent('HomePage_alert_dialog');
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text('Sucesso!'),
                    content: Text(
                        'Sua conta para recebindo foi criada, agora você já pode começar a alugar e receber pela nossa plataforma!'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Yuhuul!'),
                      ),
                    ],
                  ),
                );
              },
            );
            logFirebaseEvent('HomePage_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              wantToRentTo: true,
              askedToRentTo: true,
            ));
          } else {
            return;
          }
        } else {
          logFirebaseEvent('HomePage_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            wantToRentTo: false,
            askedToRentTo: true,
          ));
          return;
        }
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

    Future<void> _initializeFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      await addFcmTokenIfNotExists(
        fcmToken,
        Platform.isIOS ? 'iOS' : 'Android',
      );
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

    return Title(
        title: 'Página Inicial',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Drawer(
              elevation: 16,
              child: WebViewAware(
                child: wrapWithModel(
                  model: _model.sideNav02Model,
                  updateCallback: () => safeSetState(() {}),
                  child: SideNav02Widget(),
                ),
              ),
            ),
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 180, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.31,
                                decoration: BoxDecoration(
                                  color: Color(0x1A003E86),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          'Jogos em Destaque',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineSmallFamily),
                                              ),
                                        ),
                                      ),
                                    ),

                                    // Adicionar Jogo do Dia?
                                    if ((_model.featuredGamesMocked != null &&
                                            (_model.featuredGamesMocked)!
                                                .isNotEmpty) ==
                                        true)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final featuredGames = FFAppState()
                                                .featuredGames
                                                .toList()
                                                .take(5)
                                                .toList();

                                            return Container(
                                              width: 350,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.24,
                                              child: CarouselSlider.builder(
                                                itemCount: featuredGames.length,
                                                itemBuilder: (context,
                                                    featuredGamesIndex, _) {
                                                  final featuredGamesItem =
                                                      featuredGames[
                                                          featuredGamesIndex];
                                                  return StreamBuilder<
                                                      GamesRecord>(
                                                    stream:
                                                        GamesRecord.getDocument(
                                                            featuredGamesItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final containerGamesRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.074,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.2,
                                                              child: Stack(
                                                                children: [
                                                                  Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        8,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: Image.network(
                                                                      containerGamesRecord.thumbnailUrl,
                                                                      width: MediaQuery.sizeOf(context).width * 0.35,
                                                                      height: MediaQuery.sizeOf(context).height * 0.2,
                                                                      fit: BoxFit.contain,
                                                                      loadingBuilder: (context, child, loadingProgress) {
                                                                        if (loadingProgress == null) return child;
                                                                        return Center(
                                                                          child: CircularProgressIndicator(
                                                                            value: loadingProgress.expectedTotalBytes != null
                                                                                ? loadingProgress.cumulativeBytesLoaded /
                                                                                    (loadingProgress.expectedTotalBytes ?? 1)
                                                                                : null,
                                                                          ),
                                                                        );
                                                                      },
                                                                      errorBuilder: (context, error, stackTrace) {
                                                                        return Center(
                                                                          child: Icon(
                                                                            Icons.broken_image,
                                                                            color: Colors.grey,
                                                                            size: 50.0,
                                                                          ),
                                                                        );
                                                                      },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            -1),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderRadius:
                                                                          20,
                                                                      buttonSize:
                                                                          32,
                                                                      fillColor:
                                                                          Color(
                                                                              0x94000000),
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .externalLinkAlt,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_externalLinkAlt_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'gameDetails',
                                                                          pathParameters:
                                                                              {
                                                                            'gameName':
                                                                                serializeParam(
                                                                              containerGamesRecord.name,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          queryParameters:
                                                                              {
                                                                            'gameObject':
                                                                                serializeParam(
                                                                              containerGamesRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            'gameObject':
                                                                                containerGamesRecord,
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              containerGamesRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0xFF26062B),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                carouselController: _model
                                                        .carouselController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          1,
                                                          featuredGames.length -
                                                              1)),
                                                  viewportFraction: 0.5,
                                                  disableCenter: false,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.25,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: true,
                                                  autoPlayAnimationDuration:
                                                      Duration(
                                                          milliseconds: 800),
                                                  autoPlayInterval: Duration(
                                                      milliseconds:
                                                          (800 + 4000)),
                                                  autoPlayCurve: Curves.linear,
                                                  pauseAutoPlayInFiniteScroll:
                                                      true,
                                                  onPageChanged: (index, _) =>
                                                      _model.carouselCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.38,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Locador do mês',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/916/600',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [],
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 32)),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Jogo do mês',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/916/600',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [],
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(height: 32)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Luderia do Mês',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/916/600',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [],
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 32)),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Categoria do Mês',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/916/600',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [],
                                                    ),
                                                  ],
                                                ),
                                              ].divide(SizedBox(height: 32)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.21,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 56, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, -0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Icon_6e7u6lrq_ON_TAP');
                                            logFirebaseEvent('Icon_drawer');
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                          child: Icon(
                                            Icons.menu,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Builder(
                                  builder: (context) {
                                    if (((currentUserDocument?.notifications
                                                    ?.toList() ??
                                                [])
                                            .isNotEmpty) ==
                                        true) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: Icon(
                                          Icons.notifications_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 32,
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 16, 0),
                                        child: Icon(
                                          Icons.notifications_none_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 32,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    width: MediaQuery.sizeOf(context).width,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
