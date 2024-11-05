import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_profile_address2_widget.dart' show AddProfileAddress2Widget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProfileAddress2Model
    extends FlutterFlowModel<AddProfileAddress2Widget> {
  ///  Local state fields for this page.

  bool addressSelected = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  String? _streetTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor insira uma rua.';
    }

    return null;
  }

  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  String? _numberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor digite o número da casa';
    }

    return null;
  }

  // State field(s) for complement widget.
  FocusNode? complementFocusNode;
  TextEditingController? complementTextController;
  String? Function(BuildContext, String?)? complementTextControllerValidator;
  // State field(s) for neighborhood widget.
  FocusNode? neighborhoodFocusNode;
  TextEditingController? neighborhoodTextController;
  String? Function(BuildContext, String?)? neighborhoodTextControllerValidator;
  // State field(s) for referencePoint widget.
  FocusNode? referencePointFocusNode;
  TextEditingController? referencePointTextController;
  String? Function(BuildContext, String?)?
      referencePointTextControllerValidator;
  // State field(s) for zipCode widget.
  FocusNode? zipCodeFocusNode;
  TextEditingController? zipCodeTextController;
  String? Function(BuildContext, String?)? zipCodeTextControllerValidator;
  String? _zipCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor digite o CEP';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  // Stores action output result for [Custom Action - getGeohash] action in Button widget.
  String? geohash;

  @override
  void initState(BuildContext context) {
    streetTextControllerValidator = _streetTextControllerValidator;
    numberTextControllerValidator = _numberTextControllerValidator;
    zipCodeTextControllerValidator = _zipCodeTextControllerValidator;
  }

  @override
  void dispose() {
    streetFocusNode?.dispose();
    streetTextController?.dispose();

    numberFocusNode?.dispose();
    numberTextController?.dispose();

    complementFocusNode?.dispose();
    complementTextController?.dispose();

    neighborhoodFocusNode?.dispose();
    neighborhoodTextController?.dispose();

    referencePointFocusNode?.dispose();
    referencePointTextController?.dispose();

    zipCodeFocusNode?.dispose();
    zipCodeTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();
  }
}
