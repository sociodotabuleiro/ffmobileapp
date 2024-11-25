import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/modify_address/modify_address_widget.dart';
import 'settings_list_address_widget.dart' show SettingsListAddressWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SettingsListAddressModel
    extends FlutterFlowModel<SettingsListAddressWidget> {
  ///  Local state fields for this page.

  AddressStruct? address;
  void updateAddressStruct(Function(AddressStruct) updateFn) {
    updateFn(address ??= AddressStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
