// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    super.key,
    this.width,
    this.height,
    required this.min,
    required this.max,
    required this.divisions,
    required this.start,
    required this.end,
    this.textColor = Colors.black,
    this.sliderColor = Colors.blue,
    this.thumbColor = Colors.white,
    this.inactiveTrackColor = Colors.grey,
    this.showLabels = true,
    this.showRangeLabels = true,
    this.minLabel = 'Min: ',
    this.maxLabel = 'Max: ',
    this.labelFontSize = 16.0,
    this.valueFontSize = 16.0,
    required this.isEnabled,
    required this.filterType,
  });

  final double? width;
  final double? height;
  final double min;
  final double max;
  final int divisions;
  final double start;
  final double end;
  final Color textColor;
  final Color sliderColor;
  final Color thumbColor;
  final Color inactiveTrackColor;
  final bool showLabels;
  final bool showRangeLabels;
  final String minLabel;
  final String maxLabel;
  final double labelFontSize;
  final double valueFontSize;
  final bool isEnabled;
  final FilterType filterType;

  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  late RangeValues _currentRangeValues;
  late TextEditingController _minController;
  late TextEditingController _maxController;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(widget.start, widget.end);
    _minController = TextEditingController(text: widget.start.toString());
    _maxController = TextEditingController(text: widget.end.toString());
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  void _updateLabels() {
    _minController.text = _currentRangeValues.start.round().toString();
    _maxController.text = _currentRangeValues.end.round().toString();
  }

  Widget buildLabel({
    required String label,
    required TextEditingController controller,
  }) {
    return Expanded(
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.labelFontSize,
            ),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              controller: controller,
              readOnly: true,
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.valueFontSize,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliderContent() {
    return Column(
      children: [
        if (widget.showLabels)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLabel(
                  label: widget.minLabel,
                  controller: _minController,
                ),
                buildLabel(
                  label: widget.maxLabel,
                  controller: _maxController,
                ),
              ],
            ),
          ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4.0,
            activeTrackColor: widget.sliderColor,
            inactiveTrackColor: widget.inactiveTrackColor,
            thumbColor: widget.thumbColor,
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            labels: widget.showRangeLabels
                ? RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  )
                : null,
            onChanged: widget.isEnabled
                ? (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                      if (!widget.showRangeLabels) {
                        _updateLabels();
                      }
                      FFAppState().update(() {
                        FFAppState().minValuePriceFilter = values.start;
                      });
                      FFAppState().update(() {
                        FFAppState().maxValuePriceFilter = values.end;
                      });
                    });
                  }
                : null,
            onChangeEnd: widget.isEnabled
                ? (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                      _updateLabels();
                      FFAppState().update(() {
                        FFAppState().minValuePriceFilter = values.start;
                      });
                      FFAppState().update(() {
                        FFAppState().maxValuePriceFilter = values.end;
                      });
                    });
                  }
                : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: buildSliderContent(),
    );
  }
}
