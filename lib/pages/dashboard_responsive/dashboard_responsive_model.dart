import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_responsive_widget.dart' show DashboardResponsiveWidget;
import 'package:flutter/material.dart';

class DashboardResponsiveModel
    extends FlutterFlowModel<DashboardResponsiveWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
