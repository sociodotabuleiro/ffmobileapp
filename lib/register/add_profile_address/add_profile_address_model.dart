import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'add_profile_address_widget.dart' show AddProfileAddressWidget;
import 'package:calendar_iagfh0/app_state.dart' as calendar_iagfh0_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProfileAddressModel extends FlutterFlowModel<AddProfileAddressWidget> {
  ///  Local state fields for this page.

  bool addressSelected = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
