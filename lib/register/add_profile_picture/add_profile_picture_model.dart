import '/flutter_flow/flutter_flow_util.dart';
import 'add_profile_picture_widget.dart' show AddProfilePictureWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddProfilePictureModel extends FlutterFlowModel<AddProfilePictureWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for raca widget.
  FocusNode? racaFocusNode;
  TextEditingController? racaTextController;
  final racaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? racaTextControllerValidator;
  String? _racaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor entre uma data de nascimento!';
    }

    if (!RegExp('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for genero widget.
  FocusNode? generoFocusNode;
  TextEditingController? generoTextController;
  final generoMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? generoTextControllerValidator;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  final idadeMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for epoca widget.
  FocusNode? epocaFocusNode;
  TextEditingController? epocaTextController;
  final epocaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? epocaTextControllerValidator;
  // State field(s) for aparenciaFisica widget.
  FocusNode? aparenciaFisicaFocusNode;
  TextEditingController? aparenciaFisicaTextController;
  final aparenciaFisicaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      aparenciaFisicaTextControllerValidator;
  // State field(s) for vestimentas widget.
  FocusNode? vestimentasFocusNode;
  TextEditingController? vestimentasTextController;
  final vestimentasMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? vestimentasTextControllerValidator;

  @override
  void initState(BuildContext context) {
    racaTextControllerValidator = _racaTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
