import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.home,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 32.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAV_BAR_COMP_homeButton_ON_TAP');
              logFirebaseEvent('homeButton_navigate_to');

              context.pushNamed('HomePage');
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            buttonSize: 55.0,
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 32.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAV_BAR_COMP_searchButton_ON_TAP');
              logFirebaseEvent('searchButton_navigate_to');

              context.pushNamed('gamesList');
            },
          ),
          FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.games,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 32.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAV_BAR_COMP_gamesButton_ON_TAP');
              logFirebaseEvent('gamesButton_navigate_to');

              context.pushNamed('myGames');
            },
          ),
          Stack(
            children: [
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 55.0,
                icon: Icon(
                  Icons.shopping_cart,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 32.0,
                ),
                onPressed: () {
                  print('cartButton pressed ...');
                },
              ),
              if ((valueOrDefault(currentUserDocument?.cartCount, 0) != null) &&
                      (valueOrDefault(currentUserDocument?.cartCount, 0) > 0)
                  ? true
                  : false)
                AuthUserStreamWidget(
                  builder: (context) => badges.Badge(
                    badgeContent: Text(
                      valueOrDefault(currentUserDocument?.cartCount, 0)
                          .toString(),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: FlutterFlowTheme.of(context).secondary,
                    elevation: 4.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                  ),
                ),
            ],
          ),
          FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 55.0,
            icon: Icon(
              Icons.person,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 32.0,
            ),
            onPressed: () async {
              logFirebaseEvent('NAV_BAR_COMP_profileButton_ON_TAP');
              logFirebaseEvent('profileButton_navigate_to');

              context.pushNamed('Profile');
            },
          ),
        ],
      ),
    );
  }
}
