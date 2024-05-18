import '/flutter_flow/flutter_flow_util.dart';
import 'add_profile_address_widget.dart' show AddProfileAddressWidget;
import 'package:flutter/material.dart';

class AddProfileAddressModel extends FlutterFlowModel<AddProfileAddressWidget> {
  ///  Local state fields for this page.

  bool addressSelected = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
