import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_list_address_widget.dart' show SettingsListAddressWidget;
import 'package:flutter/material.dart';

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
