import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/games/my_game_config_sheet/my_game_config_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'game_details_model.dart';
export 'game_details_model.dart';

class GameDetailsWidget extends StatefulWidget {
  const GameDetailsWidget({
    super.key,
    required this.gameObject,
    required this.gameName,
  });

  final GamesRecord? gameObject;
  final String? gameName;

  @override
  State<GameDetailsWidget> createState() => _GameDetailsWidgetState();
}

class _GameDetailsWidgetState extends State<GameDetailsWidget>
    with TickerProviderStateMixin {
  late GameDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameDetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'gameDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('GAME_DETAILS_gameDetails_ON_INIT_STATE');
      _model.wishlisted = (currentUserDocument?.wishlist.toList() ?? []).contains(widget.gameObject?.reference);
      _model.favorited = (currentUserDocument?.favoriteList.toList() ?? []).contains(widget.gameObject?.reference);
      logFirebaseEvent('gameDetails_update_page_state');
      safeSetState(() {});
      if (FFAppState().myGamesGameRef.contains(widget.gameObject?.reference) ==
          true) {
        logFirebaseEvent('gameDetails_update_page_state');
        _model.myGameRef = null;
        safeSetState(() {});
      }
      logFirebaseEvent('gameDetails_update_page_state');
      _model.timesFavorited = valueOrDefault<int>(
        widget.gameObject?.timesFavorited,
        0,
      );
      safeSetState(() {});
      logFirebaseEvent('gameDetails_update_page_state');
      _model.timesWishlisted = valueOrDefault<int>(
        widget.gameObject?.timesWishlisted,
        0,
      );
      safeSetState(() {});
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'conditionalBuilderOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-44.99999999999999, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'conditionalBuilderOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-44.99999999999999, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() async {

    if (_model.wishlisted != (currentUserDocument?.wishlist.contains(widget.gameObject?.reference) ?? false)) {
    await currentUserReference?.update({
      'wishlist': _model.wishlisted
          ? FieldValue.arrayUnion([widget.gameObject?.reference])
          : FieldValue.arrayRemove([widget.gameObject?.reference]),
    });

    // Increment or decrement the `timesWishlisted` in gameObject
    await widget.gameObject?.reference.update({
      'timesWishlisted': FieldValue.increment(_model.wishlisted ? 1 : -1),
    });
  }

  if (_model.favorited != (currentUserDocument?.favoriteList.contains(widget.gameObject?.reference) ?? false)) {
    await currentUserReference?.update({
      'favoriteList': _model.favorited
          ? FieldValue.arrayUnion([widget.gameObject?.reference])
          : FieldValue.arrayRemove([widget.gameObject?.reference]),
    });

    // Increment or decrement the `timesFavorited` in gameObject
    await widget.gameObject?.reference.update({
      'timesFavorited': FieldValue.increment(_model.favorited ? 1 : -1),
    });
  }
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<calendar_iagfh0_app_state.FFAppState>();

    return Title(
        title: ':gameName',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.9, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'GAME_DETAILS_PAGE_Icon_zl75oha7_ON_TAP');
                                logFirebaseEvent('Icon_navigate_back');
                                context.safePop();
                              },
                              child: Icon(
                                Icons.chevron_left_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 32.0,
                              ),
                            ),
                          ),
                        ),
                        if (FFAppState()
                                .myGamesGameRef
                                .contains(widget.gameObject?.reference) ==
                            true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'GAME_DETAILS_PAGE_Icon_9h1tjnup_ON_TAP');
                                logFirebaseEvent('Icon_custom_action');
                                _model.myGamesRef =
                                    await actions.getMyGamesRefFromGamesId(
                                  widget.gameObject!.reference,
                                );
                                logFirebaseEvent('Icon_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.25,
                                            child: MyGameConfigSheetWidget(
                                              gameRef:
                                                  widget.gameObject!.reference,
                                              gameName:
                                                  widget.gameObject!.name,
                                              myGameRef: _model.myGamesRef!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200.0,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (((widget.gameObject?.galleryURLs != null &&
                                            (widget.gameObject?.galleryURLs)!
                                                .isNotEmpty) ==
                                        true) &&
                                    (widget.gameObject!.galleryURLs.isNotEmpty))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final images = widget
                                                .gameObject?.galleryURLs
                                                .toList() ??
                                            [];

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 190.0,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 40.0),
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: max(
                                                              0,
                                                              min(
                                                                  0,
                                                                  images.length -
                                                                      1))),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: images.length,
                                                  itemBuilder:
                                                      (context, imagesIndex) {
                                                    final imagesItem =
                                                        images[imagesIndex];
                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: OctoImage(
                                                        placeholderBuilder:
                                                            (_) =>
                                                                SizedBox.expand(
                                                          child: Image(
                                                            image: BlurHashImage(widget
                                                                    .gameObject!
                                                                    .galleryBluehash[
                                                                imagesIndex]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        image: NetworkImage(
                                                          widget.gameObject!
                                                                  .galleryURLs[
                                                              imagesIndex],
                                                        ),
                                                        width: 300.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'imageOnPageLoadAnimation']!);
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 16.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    images.length -
                                                                        1))),
                                                    count: images.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect: smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 3.0,
                                                      spacing: 8.0,
                                                      radius: 16.0,
                                                      dotWidth: 16.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'GAME_DETAILS_PAGE_Image_mjqq5prs_ON_TAP');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              widget.gameObject!.thumbnailUrl,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: widget
                                                .gameObject!.thumbnailUrl,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: widget.gameObject!.thumbnailUrl,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          widget.gameObject!.thumbnailUrl,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.gameName,
                                'nomeDoJogo',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displaySmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .displaySmallFamily),
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.gameObject?.rating.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.groups_2,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.gameObject?.playerCountMax
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.clock,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 22.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.gameObject?.playTime
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.child_care,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.gameObject?.ageRecommendation
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Descrição',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation2']!),
                          ),
                          if (!_model.lerMais)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 0.0, 0.0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  widget.gameObject?.description,
                                  '--',
                                ).maybeHandleOverflow(
                                  maxChars: 100,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              )).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation3']!),
                            ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Visibility(
                              visible: _model.lerMais == true,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    widget.gameObject?.description,
                                    '--',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                )).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation4']!),
                              ),
                            ),
                          ),
                          if (!_model.lerMais)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'GAME_DETAILS_PAGE_Text_88j0pnkr_ON_TAP');
                                  logFirebaseEvent('Text_update_page_state');
                                  _model.lerMais = true;
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Ler mais',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation5']!),
                            ),
                          if (_model.lerMais)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'GAME_DETAILS_PAGE_Text_9j25wwop_ON_TAP');
                                  logFirebaseEvent('Text_update_page_state');
                                  _model.lerMais = false;
                                  safeSetState(() {});
                                },
                                child: Text(
                                  'Esconder...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation6']!),
                            ),
                          Divider(
                            height: 32.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation1']!),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (_model.favorited) {
                                        return FlutterFlowIconButton(
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.star,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'GAME_DETAILS_favoriteIconButtonOn_ON_TAP');
                                            logFirebaseEvent(
                                                'favoriteIconButtonOn_update_page_state');
                                            _model.favorited = false;
                                            _model.timesFavorited += _model.favorited ? 1 : -1;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'favoriteIconButtonOn_widget_animation');
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation1'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconButtonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'favoriteIconButtonOn_update_page_state');
                                            setState(() {});
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation1']!,
                                        );
                                      } else {
                                        return FlutterFlowIconButton(
                                          borderRadius: 32.0,
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.star_border,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'GAME_DETAILS_favoriteIconButtonOff_ON_TA');
                                            _model.favorited = true;
                                            _model.timesFavorited += _model.favorited ? 1 : -1;
                                            safeSetState(() {});
                                                  logFirebaseEvent(
                                                'favoriteIconButtonOff_update_page_state');
                                            logFirebaseEvent(
                                                'favoriteIconButtonOff_widget_animation');
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation2'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconButtonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'favoriteIconButtonOff_update_page_state');
                                            setState(() {});
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation2']!,
                                        );
                                      }
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'conditionalBuilderOnPageLoadAnimation1']!),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: StreamBuilder<DocumentSnapshot>(
                                      stream: widget.gameObject?.reference.snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Text(
                                            _model.timesFavorited.toString(),
                                            style: FlutterFlowTheme.of(context).bodyLarge,
                                          );
                                        }
                                         final timesFavorited = snapshot.data!['timesFavorited'] ?? _model.timesFavorited;
                                          if (timesFavorited != _model.timesFavorited) {
                                              _model.timesFavorited = timesFavorited;
                                            }
                                        return Text(
                                          timesFavorited.toString(),     
                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Favoritos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (_model.wishlisted) {
                                        return FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 32.0,
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.favorite_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'GAME_DETAILS_wishlistedIconButtonOn_ON_T');
                                            _model.wishlisted = false;
                                            _model.timesWishlisted += _model.wishlisted ? 1 : -1;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'wishlistedIconButtonOn_widget_animation');
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation3'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconButtonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'wishlistedIconButtonOn_update_page_state');
                                            setState(() {});
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation3']!,
                                        );
                                      } else {
                                        return FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 32.0,
                                          buttonSize: 45.0,
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 32.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'GAME_DETAILS_wishlistedIconButtonOff_ON_');
                                             _model.wishlisted = true;
                                             _model.timesWishlisted += _model.wishlisted ? 1 : -1;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'wishlistedIconButtonOff_update_page_stat');
                                            logFirebaseEvent(
                                                'wishlistedIconButtonOff_widget_animation');
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation4'] !=
                                                null) {
                                              await animationsMap[
                                                      'iconButtonOnActionTriggerAnimation4']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                            logFirebaseEvent(
                                                'wishlistedIconButtonOff_update_page_stat');
                                            setState(() {});
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconButtonOnActionTriggerAnimation4']!,
                                        );
                                      }
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'conditionalBuilderOnPageLoadAnimation2']!),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: StreamBuilder<DocumentSnapshot>(
                                      stream: widget.gameObject?.reference.snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Text(
                                            _model.timesWishlisted.toString(),
                                            style: FlutterFlowTheme.of(context).bodyLarge,
                                          );
                                        }
                                         final timesWishlisted = snapshot.data!['timesWishlisted'] ?? _model.timesWishlisted;
                                          if (timesWishlisted != _model.timesWishlisted) {
                                              _model.timesWishlisted = timesWishlisted;
                                            }
                                        return Text(
                                          timesWishlisted.toString(),     
                                          style: FlutterFlowTheme.of(context).bodyLarge,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Lista de desejo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.dollarSign,
                                    color: widget.gameObject!.timesRented > 0
                                        ? FlutterFlowTheme.of(context).success
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    size: 32.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.gameObject?.timesRented
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'Alugado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation2']!),
                          Divider(
                            height: 32.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ).animateOnPageLoad(
                              animationsMap['dividerOnPageLoadAnimation2']!),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Builder(
                              builder: (context) {
                                final categoriesList =
                                    widget.gameObject?.categories.toList() ??
                                        [];

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children:
                                        List.generate(categoriesList.length,
                                            (categoriesListIndex) {
                                      final categoriesListItem =
                                          categoriesList[categoriesListIndex];
                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/169/600',
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).divide(const SizedBox(width: 15.0)),
                                  ),
                                );
                              },
                            ),
                          if ((widget.gameObject?.galleryURLs != null &&
                                  (widget.gameObject?.galleryURLs)!
                                      .isNotEmpty) ==
                              true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Mídias',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final imagesUrls = widget
                                              .gameObject?.galleryURLs
                                              .toList() ??
                                          [];

                                      return SizedBox(
                                        width: double.infinity,
                                        height: 180.0,
                                        child: CarouselSlider.builder(
                                          itemCount: imagesUrls.length,
                                          itemBuilder:
                                              (context, imagesUrlsIndex, _) {
                                            final imagesUrlsItem =
                                                imagesUrls[imagesUrlsIndex];
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                imagesUrlsItem,
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(0,
                                                min(1, imagesUrls.length - 1)),
                                            viewportFraction: 0.5,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.25,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: false,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Clique aqui para ler os reviews dos jogos',
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
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Reviews',
                                        icon: const Icon(
                                          Icons.rate_review_sharp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (valueOrDefault<bool>(
                  FFAppState()
                          .myGamesGameRef
                          .contains(widget.gameObject?.reference) ==
                      false,
                  false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 24.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x55000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          valueOrDefault<double>(
                                                widget
                                                    .gameObject?.averagePrice,
                                                0.0,
                                              ) /
                                              5,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.commaDecimal,
                                          currency: 'R\$',
                                        ),
                                        'R\$0,00',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '+ entrega',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Lexend Deca'),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'preço médio',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Lexend Deca'),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            if (FFAppConstants.cities2Rent.contains(
                                    functions.normalizeString(
                                        currentUserDocument!.address.city)) ==
                                true)
                              AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: (widget
                                              .gameObject?.availableToRent ==
                                          false)
                                      ? null
                                      : () async {
                                          logFirebaseEvent(
                                              'GAME_DETAILS_PAGE_rentButton_ON_TAP');
                                          if ((widget.gameObject
                                                      ?.availableToRent ==
                                                  true) &&
                                              FFDevEnvironmentValues()
                                                  .isRentingAvailable) {
                                            logFirebaseEvent(
                                                'rentButton_navigate_to');

                                            context.pushNamed(
                                              'toRentList',
                                              queryParameters: {
                                                'gameObject': serializeParam(
                                                  widget.gameObject,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'gameObject':
                                                    widget.gameObject,
                                              },
                                            );
                                          } else {
                                            return;
                                          }
                                        },
                                  text: (widget.gameObject?.availableToRent ==
                                              true) &&
                                          FFDevEnvironmentValues()
                                              .isRentingAvailable
                                      ? 'Alugar'
                                      : 'Indisponível',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: (widget.gameObject
                                                    ?.availableToRent ==
                                                true) &&
                                            FFDevEnvironmentValues()
                                                .isRentingAvailable
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: (widget.gameObject
                                                          ?.availableToRent ==
                                                      true) &&
                                                  FFDevEnvironmentValues()
                                                      .isRentingAvailable
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    disabledTextColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
              ],
            ),
          ),
        ));
  }
}
