import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/register/confirm_prompt_avatar/confirm_prompt_avatar_widget.dart';
import 'add_profile_picture_widget.dart' show AddProfilePictureWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProfilePictureModel extends FlutterFlowModel<AddProfilePictureWidget> {
  ///  Local state fields for this page.

  String? apiUrl;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for raca widget.
  FocusNode? racaFocusNode;
  TextEditingController? racaTextController;
  String? Function(BuildContext, String?)? racaTextControllerValidator;
  // State field(s) for genero widget.
  FocusNode? generoFocusNode;
  TextEditingController? generoTextController;
  String? Function(BuildContext, String?)? generoTextControllerValidator;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for epoca widget.
  FocusNode? epocaFocusNode;
  TextEditingController? epocaTextController;
  String? Function(BuildContext, String?)? epocaTextControllerValidator;
  // State field(s) for aparenciaFisica widget.
  FocusNode? aparenciaFisicaFocusNode;
  TextEditingController? aparenciaFisicaTextController;
  String? Function(BuildContext, String?)?
      aparenciaFisicaTextControllerValidator;
  // State field(s) for vestimentas widget.
  FocusNode? vestimentasFocusNode;
  TextEditingController? vestimentasTextController;
  String? Function(BuildContext, String?)? vestimentasTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    racaFocusNode?.dispose();
    racaTextController?.dispose();

    generoFocusNode?.dispose();
    generoTextController?.dispose();

    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    epocaFocusNode?.dispose();
    epocaTextController?.dispose();

    aparenciaFisicaFocusNode?.dispose();
    aparenciaFisicaTextController?.dispose();

    vestimentasFocusNode?.dispose();
    vestimentasTextController?.dispose();
  }
}
