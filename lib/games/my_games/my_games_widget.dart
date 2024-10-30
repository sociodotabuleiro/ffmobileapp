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
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_games_model.dart';
export 'my_games_model.dart';

class MyGamesWidget extends StatefulWidget {
  const MyGamesWidget({super.key});

  @override
  State<MyGamesWidget> createState() => _MyGamesWidgetState();
}

class _MyGamesWidgetState extends State<MyGamesWidget>
    with TickerProviderStateMixin {
  late MyGamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyGamesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myGames'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_GAMES_PAGE_myGames_ON_INIT_STATE');
      logFirebaseEvent('myGames_update_page_state');
      _model.finalIndexFavoriites = valueOrDefault<int>(
        (currentUserDocument?.favoriteList?.toList() ?? []).length,
        0,
      );
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'gamelistCardOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'gamelistCardOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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

    return StreamBuilder<List<MyGamesRecord>>(
      stream: queryMyGamesRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
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
          );
        }
        List<MyGamesRecord> myGamesMyGamesRecordList = snapshot.data!;

        return Title(
            title: 'myGames',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'MY_GAMES_arrow_back_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.safePop();
                    },
                  ),
                  title: Text(
                    'Meus jogos',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleLargeFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleLargeFamily),
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'MY_GAMES_TextField_wd1335ow_ON_TEXTFIELD');
                                          logFirebaseEvent(
                                              'TextField_custom_action');
                                          _model.searchedGamesList =
                                              await actions.searchGameLists(
                                            _model.textController.text,
                                          );

                                          safeSetState(() {});
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Procurar por meus jogos',
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
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
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.tune_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(-1.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).primary,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                tabs: [
                                  Tab(
                                    text: 'Meus jogos',
                                  ),
                                  Tab(
                                    text: 'Favoritos',
                                  ),
                                  Tab(
                                    text: 'Wishlist',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {
                                      logFirebaseEvent(
                                          'MY_GAMES_PAGE_Tab_3fy869b4_ON_TAP');
                                      while (_model.currentIndexFavorites <
                                          _model.finalIndexFavoriites) {
                                        logFirebaseEvent('Tab_backend_call');
                                        _model.gamesDocument =
                                            await GamesRecord.getDocumentOnce(
                                                (currentUserDocument
                                                            ?.favoriteList
                                                            ?.toList() ??
                                                        [])[
                                                    _model
                                                        .currentIndexFavorites]);
                                        logFirebaseEvent(
                                            'Tab_update_page_state');
                                        _model.addToFavoritedGamesDocList(
                                            _model.gamesDocument!);
                                        _model.addToFavoritedGamesNames(
                                            functions.normalizeString(
                                                _model.gamesDocument!.name));
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    () async {
                                      logFirebaseEvent(
                                          'MY_GAMES_PAGE_Tab_uldtadm8_ON_TAP');
                                      while (_model.currentIndexWishlist <
                                          _model.finalIndexWishlist) {
                                        logFirebaseEvent('Tab_backend_call');
                                        _model.gamesDocumentWishlist =
                                            await GamesRecord.getDocumentOnce(
                                                (currentUserDocument?.wishlist
                                                            ?.toList() ??
                                                        [])[
                                                    _model
                                                        .currentIndexWishlist]);
                                        logFirebaseEvent(
                                            'Tab_update_page_state');
                                        _model.addToWishlistGamesDocList(_model
                                            .gamesDocumentWishlist!.reference);
                                        _model.addToWishlistGamesNames(
                                            functions.normalizeString(_model
                                                .gamesDocumentWishlist!.name));
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    }
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          return Builder(
                                            builder: (context) {
                                              if ((_model.searchedGamesList !=
                                                          null &&
                                                      (_model.searchedGamesList)!
                                                          .isNotEmpty) ==
                                                  true) {
                                                return Builder(
                                                  builder: (context) {
                                                    final myGamesSearchedRef =
                                                        _model
                                                            .searchedGamesList!
                                                            .map((e) => e)
                                                            .toList();
                                                    if (myGamesSearchedRef
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/logo_text.png',
                                                        ),
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            myGamesSearchedRef
                                                                .length,
                                                            (myGamesSearchedRefIndex) {
                                                          final myGamesSearchedRefItem =
                                                              myGamesSearchedRef[
                                                                  myGamesSearchedRefIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: StreamBuilder<
                                                                GamesRecord>(
                                                              stream: GamesRecord
                                                                  .getDocument(
                                                                      myGamesSearchedRefItem),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerGamesRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.24,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      GamelistCardWidget(
                                                                    key: Key(
                                                                        'Keyc34_${myGamesSearchedRefIndex}_of_${myGamesSearchedRef.length}'),
                                                                    gameObject:
                                                                        containerGamesRecord,
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'gamelistCardOnPageLoadAnimation1']!),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if ((myGamesMyGamesRecordList
                                                      .isNotEmpty) ==
                                                  true) {
                                                return Builder(
                                                  builder: (context) {
                                                    final myGamesRef =
                                                        myGamesMyGamesRecordList
                                                            .map((e) => e)
                                                            .toList();
                                                    if (myGamesRef.isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/logo_text.png',
                                                        ),
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            myGamesRef.length,
                                                            (myGamesRefIndex) {
                                                          final myGamesRefItem =
                                                              myGamesRef[
                                                                  myGamesRefIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        16.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: StreamBuilder<
                                                                GamesRecord>(
                                                              stream: GamesRecord
                                                                  .getDocument(
                                                                      myGamesRefItem
                                                                          .gameRef!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerGamesRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.24,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      GamelistCardWidget(
                                                                    key: Key(
                                                                        'Key5zc_${myGamesRefIndex}_of_${myGamesRef.length}'),
                                                                    gameObject:
                                                                        containerGamesRecord,
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'gamelistCardOnPageLoadAnimation2']!),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          return Builder(
                                            builder: (context) {
                                              if (_model.favoritedGamesNames
                                                      .contains(functions
                                                          .normalizeString(_model
                                                              .textController
                                                              .text)) ==
                                                  true) {
                                                return Builder(
                                                  builder: (context) {
                                                    final favoritedGamesSearched = _model
                                                        .favoritedGamesDocList
                                                        .where((e) =>
                                                            functions
                                                                .normalizeString(
                                                                    e.name) ==
                                                            functions
                                                                .normalizeString(
                                                                    _model
                                                                        .textController
                                                                        .text))
                                                        .toList()
                                                        .map((e) => e)
                                                        .toList();
                                                    if (favoritedGamesSearched
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/logo_text.png',
                                                        ),
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            favoritedGamesSearched
                                                                .length,
                                                            (favoritedGamesSearchedIndex) {
                                                          final favoritedGamesSearchedItem =
                                                              favoritedGamesSearched[
                                                                  favoritedGamesSearchedIndex];
                                                          return GamelistCardWidget(
                                                            key: Key(
                                                                'Keyqrs_${favoritedGamesSearchedIndex}_of_${favoritedGamesSearched.length}'),
                                                            gameObject:
                                                                favoritedGamesSearchedItem,
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if (((currentUserDocument
                                                              ?.favoriteList
                                                              ?.toList() ??
                                                          [])
                                                      .isNotEmpty) ==
                                                  true) {
                                                return Builder(
                                                  builder: (context) {
                                                    final favoritedGamesNotSearched =
                                                        (currentUserDocument
                                                                    ?.favoriteList
                                                                    ?.toList() ??
                                                                [])
                                                            .map((e) => e)
                                                            .toList();
                                                    if (favoritedGamesNotSearched
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/logo_text.png',
                                                        ),
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            favoritedGamesNotSearched
                                                                .length,
                                                            (favoritedGamesNotSearchedIndex) {
                                                          final favoritedGamesNotSearchedItem =
                                                              favoritedGamesNotSearched[
                                                                  favoritedGamesNotSearchedIndex];
                                                          return StreamBuilder<
                                                              GamesRecord>(
                                                            stream: GamesRecord
                                                                .getDocument(
                                                                    favoritedGamesNotSearchedItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final containerGamesRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    GamelistCardWidget(
                                                                  key: Key(
                                                                      'Keysok_${favoritedGamesNotSearchedIndex}_of_${favoritedGamesNotSearched.length}'),
                                                                  gameObject:
                                                                      containerGamesRecord,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          return Builder(
                                            builder: (context) {
                                              if (_model.wishlistGamesNames
                                                      .contains(functions
                                                          .normalizeString(_model
                                                              .textController
                                                              .text)) ==
                                                  true) {
                                                return Builder(
                                                  builder: (context) {
                                                    final wishList =
                                                        FFAppState()
                                                            .wishlist
                                                            .toList();
                                                    if (wishList.isEmpty) {
                                                      return Center(
                                                        child: Image.asset(
                                                          'assets/images/logo_text.png',
                                                        ),
                                                      );
                                                    }

                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: List.generate(
                                                            wishList.length,
                                                            (wishListIndex) {
                                                          final wishListItem =
                                                              wishList[
                                                                  wishListIndex];
                                                          return StreamBuilder<
                                                              GamesRecord>(
                                                            stream: GamesRecord
                                                                .getDocument(
                                                                    wishListItem),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final containerGamesRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    GamelistCardWidget(
                                                                  key: Key(
                                                                      'Keyn6j_${wishListIndex}_of_${wishList.length}'),
                                                                  gameObject:
                                                                      containerGamesRecord,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        } else {
                                          return Builder(
                                            builder: (context) {
                                              if ((FFAppState()
                                                      .wishlist
                                                      .isNotEmpty) ==
                                                  true) {
                                                return AuthUserStreamWidget(
                                                  builder: (context) => Builder(
                                                    builder: (context) {
                                                      final wishList =
                                                          (currentUserDocument
                                                                      ?.wishlist
                                                                      ?.toList() ??
                                                                  [])
                                                              .map((e) => e)
                                                              .toList();
                                                      if (wishList.isEmpty) {
                                                        return Center(
                                                          child: Image.asset(
                                                            'assets/images/logo_text.png',
                                                          ),
                                                        );
                                                      }

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              wishList.length,
                                                              (wishListIndex) {
                                                            final wishListItem =
                                                                wishList[
                                                                    wishListIndex];
                                                            return StreamBuilder<
                                                                GamesRecord>(
                                                              stream: GamesRecord
                                                                  .getDocument(
                                                                      wishListItem),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerGamesRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      GamelistCardWidget(
                                                                    key: Key(
                                                                        'Key2a8_${wishListIndex}_of_${wishList.length}'),
                                                                    gameObject:
                                                                        containerGamesRecord,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/logo_text.png',
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
