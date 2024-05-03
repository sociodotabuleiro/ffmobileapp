import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_profile_personal_info_widget.dart'
    show AddProfilePersonalInfoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddProfilePersonalInfoModel
    extends FlutterFlowModel<AddProfilePersonalInfoWidget> {
  ///  Local state fields for this page.

  Gender? genderChoice = Gender.female;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor digite o primeiro nome';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor digite o sobrenome';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthTextController;
  final dateOfBirthMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateOfBirthTextControllerValidator;
  String? _dateOfBirthTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor entre uma data de nascimento!';
    }

    if (!RegExp('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor insira seu CPF';
    }

    return null;
  }

  // State field(s) for rg widget.
  FocusNode? rgFocusNode;
  TextEditingController? rgTextController;
  final rgMask = MaskTextInputFormatter(mask: 'AA ##.###.###');
  String? Function(BuildContext, String?)? rgTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    dateOfBirthTextControllerValidator = _dateOfBirthTextControllerValidator;
    cpfTextControllerValidator = _cpfTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    dateOfBirthFocusNode?.dispose();
    dateOfBirthTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    rgFocusNode?.dispose();
    rgTextController?.dispose();
  }
}
