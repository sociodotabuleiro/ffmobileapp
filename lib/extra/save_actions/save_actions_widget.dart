import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'save_actions_model.dart';
export 'save_actions_model.dart';

class SaveActionsWidget extends StatefulWidget {
  const SaveActionsWidget({super.key});

  @override
  State<SaveActionsWidget> createState() => _SaveActionsWidgetState();
}

class _SaveActionsWidgetState extends State<SaveActionsWidget> {
  late SaveActionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveActionsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'saveActions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SAVE_ACTIONS_saveActions_ON_INIT_STATE');
      if ((currentUserDocument?.completedRegisterPages?.toList() ?? []).last ==
          4) {
        logFirebaseEvent('saveActions_alert_dialog');
        var confirmDialogResponse = await showDialog<bool>(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    title: Text('Adicionar imagem de perfil'),
                    content: Text('Deseja criar seu avatar agora?'),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, false),
                        child: Text('Não'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(alertDialogContext, true),
                        child: Text('Sim'),
                      ),
                    ],
                  ),
                );
              },
            ) ??
            false;
        if (confirmDialogResponse) {
          logFirebaseEvent('saveActions_navigate_to');

          context.pushNamed('addProfilePicture');
        } else {
          return;
        }
      } else {
        if ((currentUserDocument?.completedRegisterPages?.toList() ?? [])
                .last ==
            3) {
          logFirebaseEvent('saveActions_alert_dialog');
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      title: Text('Adicionar jogos'),
                      content:
                          Text('Deseja adicionar jogos da ludopédia agora?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('Não'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('Sim'),
                        ),
                      ],
                    ),
                  );
                },
              ) ??
              false;
          if (confirmDialogResponse) {
            logFirebaseEvent('saveActions_navigate_to');

            context.pushNamed('addProfileGames');
          } else {
            return;
          }
        } else {
          if ((currentUserDocument?.completedRegisterPages?.toList() ?? [])
                  .last ==
              2) {
            logFirebaseEvent('saveActions_alert_dialog');
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: Text('Adicionar número'),
                        content: Text('Deseja adicionar seu número agora?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('Não'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Sim'),
                          ),
                        ],
                      ),
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              logFirebaseEvent('saveActions_navigate_to');

              context.pushNamed('addProfilePhoneNumber');
            } else {
              return;
            }
          } else {
            if ((currentUserDocument?.completedRegisterPages?.toList() ?? [])
                    .last ==
                1) {
              logFirebaseEvent('saveActions_navigate_to');

              context.pushNamed('addProfileAddress');
            } else {
              logFirebaseEvent('saveActions_navigate_to');

              context.pushNamed(
                'addProfilePersonalInfo',
                queryParameters: {
                  'userRef': serializeParam(
                    currentUserReference,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            }
          }
        }
      }
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
    return Title(
        title: 'saveActions',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Page Title',
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
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ),
          ),
        ));
  }
}
