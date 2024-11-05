import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
            icon: Icon(
              Icons.search,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 38.0,
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
                onPressed: () async {
                  logFirebaseEvent('NAV_BAR_COMP_requestsButton_ON_TAP');
                  logFirebaseEvent('requestsButton_navigate_to');

                  context.pushNamed('deliveryStatus');
                },
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
