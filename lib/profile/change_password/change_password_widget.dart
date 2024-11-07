import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:local_auth/local_auth.dart'; // For biometric authentication
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase auth

import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  /// Allow the user to change its password.
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late ChangePasswordModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LocalAuthentication localAuth = LocalAuthentication(); // Biometric auth

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'changePassword'});
    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.passwordConfirmTextController ??= TextEditingController();
    _model.passwordConfirmFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _changePassword(String newPassword) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      bool didAuthenticate = false;

      // Attempt biometric authentication
      try {
        didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Autentique a biometria para modificar a senha!',
          options: const AuthenticationOptions(biometricOnly: true),
        );
      } catch (e) {
        print('Autenticação biométrica falhou: $e');
      }

      if (didAuthenticate) {
        // Biometric authentication succeeded, update password directly
        await user.updatePassword(newPassword);
        print('Senha modificada com sucesso via biometria!');
        logFirebaseEvent(
        'password_changed',
        parameters: {'method': 'biometric'},
      );
      } else {
        // Prompt for current password if biometrics fail or aren't available
        String? currentPassword = await _promptForPassword(context);
        if (currentPassword != null && currentPassword.isNotEmpty) {
          try {
            AuthCredential credential = EmailAuthProvider.credential(
              email: user.email!,
              password: currentPassword,
            );
            await user.reauthenticateWithCredential(credential);
            await user.updatePassword(newPassword);
            print('Senha modificada com sucesso!');
            logFirebaseEvent(
            'password_changed',
            parameters: {'method': 'password'},
          );
          } on FirebaseAuthException catch (e) {
            print('Erro: $e');
          }
        } else {
          print('Entrada de senha cancelada ou vazia');
        }
      }
    } else {
      print('Nenhum usuário esta logado');
    }
  }

  Future<String?> _promptForPassword(BuildContext context) async {
    final TextEditingController passwordController = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Insira senha atual'),
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(hintText: 'Senha atual'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null), // Cancel dialog
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(passwordController.text),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'changePassword',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                buttonSize: 48,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25,
                ),
                onPressed: () async {
                  logFirebaseEvent('CHANGE_PASSWORD_arrow_back_rounded_ICN_O');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                'Modificar a senha',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: 100,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0, -1),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsets.all(32),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 24),
                                      child: Text(
                                        'Digite a nova senha',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Container(
                                        width: 370,
                                        child: TextFormField(
                                          controller:
                                              _model.passwordTextController,
                                          focusNode: _model.passwordFocusNode,
                                          autofocus: true,
                                          obscureText:
                                              !_model.passwordVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Senha',
                                            suffixIcon: InkWell(
                                              onTap: () => safeSetState(
                                                () => _model
                                                        .passwordVisibility =
                                                    !_model.passwordVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          validator: _model
                                              .passwordTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: Container(
                                        width: 370,
                                        child: TextFormField(
                                          controller: _model
                                              .passwordConfirmTextController,
                                          focusNode:
                                              _model.passwordConfirmFocusNode,
                                          autofocus: true,
                                          obscureText:
                                              !_model.passwordConfirmVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Confirmar Senha',
                                            suffixIcon: InkWell(
                                              onTap: () => safeSetState(
                                                () => _model
                                                        .passwordConfirmVisibility =
                                                    !_model
                                                        .passwordConfirmVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.passwordConfirmVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                          validator: _model
                                              .passwordConfirmTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 16),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          // Password change logic
                                          String newPassword =
                                              _model.passwordTextController.text;
                                          if (newPassword ==
                                              _model
                                                  .passwordConfirmTextController
                                                  .text) {
                                            _changePassword(newPassword);
                                          } else {
                                            print('Senhas não são iguais');
                                          }
                                        },
                                        text: 'Trocar senha',
                                        options: FFButtonOptions(
                                          width: 370,
                                          height: 44,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .copyWith(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
