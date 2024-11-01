import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<DateTime> choosenDates = [];
  void addToChoosenDates(DateTime item) => choosenDates.add(item);
  void removeFromChoosenDates(DateTime item) => choosenDates.remove(item);
  void removeAtIndexFromChoosenDates(int index) => choosenDates.removeAt(index);
  void insertAtIndexInChoosenDates(int index, DateTime item) =>
      choosenDates.insert(index, item);
  void updateChoosenDatesAtIndex(int index, Function(DateTime) updateFn) =>
      choosenDates[index] = updateFn(choosenDates[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
