import 'dart:math';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeChanged;

  const CustomTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeChanged,
  });

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late int _hour;
  late int _minute;
  late bool _isAM;

  FixedExtentScrollController? _hourController;
  FixedExtentScrollController? _minuteController;

  @override
  void initState() {
    super.initState();
    _hour = widget.initialTime.hourOfPeriod;
    _minute = widget.initialTime.minute;
    _isAM = widget.initialTime.period == DayPeriod.am;

      // Initialize controllers to start at the correct positions
    _hourController = FixedExtentScrollController(initialItem: _hour == 0 ? 11 : _hour - 1); // 1-12 mapping
    _minuteController = FixedExtentScrollController(initialItem: _minute);

    setState(() {
    _hourController = FixedExtentScrollController(
      initialItem: _hour == 0 ? 11 : _hour - 1, // Map 1-12
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _minute,
    );
  });
  }

  

  void _updateTime() {
    final hourIn24Format = _isAM
      ? (_hour == 12 ? 0 : _hour) // Convert 12 AM to 00
      : (_hour == 12 ? 12 : _hour + 12); // Keep 12 PM as 12
    final newTime = TimeOfDay(
        hour: hourIn24Format,
        minute: _minute,
      );
    widget.onTimeChanged(newTime);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Selecione Horário',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Hour Picker
                      Flexible(
                        child: SizedBox(
                          height: 150,
                          child: ListWheelScrollView.useDelegate(
                            controller: _hourController,
                            itemExtent: 40,
                            perspective: 0.005,
                            physics: const FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _hour = ((index % 12) + 12) % 12 + 1; // Wrap hours to 1-12
                                _updateTime();
                              });
                            },
                            childDelegate: ListWheelChildLoopingListDelegate(
                              children: List.generate(12, (i) => (i + 1).toString())
                                  .map((e) => Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      // Minute Picker
                      Flexible(
                        child: SizedBox(
                          height: 150,
                          child: ListWheelScrollView.useDelegate(
                            controller: _minuteController,
                            itemExtent: 40,
                            perspective: 0.005,
                            physics: const FixedExtentScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _minute = index % 60; // Wrap minutes to 0-59
                                _updateTime();
                              });
                            },
                            childDelegate: ListWheelChildLoopingListDelegate(
                              children: List.generate(60, (i) => i.toString().padLeft(2, '0'))
                                  .map((e) => Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                        '${_hour == 0 ? 12 : _hour}:${_minute.toString().padLeft(2, '0')} ${_isAM ? 'AM' : 'PM'}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isAM = true;
                            _updateTime();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                        foregroundColor: _isAM ? Colors.white : Colors.black, backgroundColor: _isAM ? Colors.blue : Colors.grey,
                        side: BorderSide(color: _isAM ? Colors.blue : Colors.grey, width: 2), // Add a border
                        elevation: _isAM ? 4 : 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'AM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAM = false;
                          _updateTime();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: !_isAM ? Colors.white : Colors.black, backgroundColor: !_isAM ? Colors.blue : Colors.grey,
                        side: BorderSide(color: !_isAM ? Colors.blue : Colors.grey, width: 2), // Add a border
                        elevation: !_isAM ? 4 : 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'PM',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                  ),
                  const SizedBox(height: 20),
                 ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      final hourIn24Format = _isAM
                          ? (_hour == 12 ? 0 : _hour) // Convert 12 AM to 00
                          : (_hour == 12 ? 12 : _hour + 12); // Keep 12 PM as 12
                      widget.onTimeChanged(
                        TimeOfDay(hour: hourIn24Format, minute: _minute),
                      );
                      },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// class ClockPainter extends CustomPainter {
//   final int hour;
//   final int minute;
//   final bool isAM;

//   ClockPainter(this.hour, this.minute, this.isAM);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = size.width / 2;

//      // Draw clock background
//     final backgroundPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(center, radius, backgroundPaint);

//     final shadowPaint = Paint()
//       ..color = Colors.grey.withOpacity(0.5)
//       ..style = PaintingStyle.fill
//       ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
//     canvas.drawCircle(center, radius * 0.95, shadowPaint);
    

//     final hourPaint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 8
//       ..strokeCap = StrokeCap.round;

//     final minutePaint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 4
//       ..strokeCap = StrokeCap.round;

//     final hourAngle = (hour % 12 + minute / 60) * (2 * pi / 12) - pi / 2;
//     final minuteAngle = minute * (2 * pi / 60) - pi / 2;

//     canvas.drawLine(
//       center,
//       center + Offset(cos(hourAngle) * radius * 0.4, sin(hourAngle) * radius * 0.4),
//       hourPaint,
//     );

//     canvas.drawLine(
//       center,
//       center + Offset(cos(minuteAngle) * radius * 0.6, sin(minuteAngle) * radius * 0.6),
//       minutePaint,
//     );

//     // Draw hour markers
//     final textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.center,
//     );

//     for (int i = 1; i <= 12; i++) {
//       final angle = i * (2 * pi / 12) - pi / 2;
//       final offset = Offset(
//         center.dx + cos(angle) * radius * 0.85,
//         center.dy + sin(angle) * radius * 0.85,
//       );

//       textPainter.text = TextSpan(
//         text: i.toString(),
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       );
//       textPainter.layout();
//       textPainter.paint(canvas, offset - Offset(textPainter.width / 2, textPainter.height / 2));
//     }

//     // Draw AM/PM indicator
//     // final ampmPaint = Paint()
//     //   ..color = Colors.green
//     //   ..style = PaintingStyle.fill;

//     // final ampmRadius = radius * 0.1;
//     // final ampmAngle = isAM ? -pi / 2 : pi / 2;
//     // final ampmOffset = Offset(
//     //   center.dx + cos(ampmAngle) * radius * 0.7,
//     //   center.dy + sin(ampmAngle) * radius * 0.7,
//     // );

//     // canvas.drawCircle(ampmOffset, ampmRadius, ampmPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }

