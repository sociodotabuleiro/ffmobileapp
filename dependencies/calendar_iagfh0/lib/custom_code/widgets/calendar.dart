// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    this.width,
    this.height,
    required this.availableDates,
    required this.onSelectedDatesChanged, // FlutterFlow action parameter for selected dates
  });

  final double? width;
  final double? height;
  final List<DateTime> availableDates; // List of available dates passed in
  final Future Function(List<DateTime>? choosenDates)?
      onSelectedDatesChanged; // Action callback

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedStartDay;
  DateTime? _selectedEndDay;
  List<DateTime> _selectedRange = [];

  // Function to check if a date is available
  bool _isDateAvailable(DateTime date) {
    return widget.availableDates.any((availableDate) =>
        availableDate.year == date.year &&
        availableDate.month == date.month &&
        availableDate.day == date.day);
  }

  // Handling date selection logic
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!_isDateAvailable(selectedDay)) {
      return;
    }
    setState(() {
      if (_selectedStartDay == null) {
        if (_isDateAvailable(selectedDay)) {
          _selectedStartDay = selectedDay;
          _selectedRange = [selectedDay];
        }
      } else if (_selectedStartDay != null && _selectedEndDay == null) {
        if (selectedDay.isBefore(_selectedStartDay!) ||
            !_isDateAvailable(selectedDay)) {
          _selectedStartDay = selectedDay;
          _selectedRange = [selectedDay];
        } else if (_isDateAvailable(selectedDay)) {
          bool hasUnavailableDates = false;
          for (DateTime date = _selectedStartDay!;
              date.isBefore(selectedDay.add(const Duration(days: 1)));
              date = date.add(const Duration(days: 1))) {
            if (!_isDateAvailable(date)) {
              hasUnavailableDates = true;
              break;
            }
          }
          if (!hasUnavailableDates) {
            _selectedEndDay = selectedDay;
            _selectedRange = [];
            for (DateTime date = _selectedStartDay!;
                date.isBefore(selectedDay.add(const Duration(days: 1)));
                date = date.add(const Duration(days: 1))) {
              _selectedRange.add(date);
            }
          }
        }
      } else if (_selectedStartDay != null && _selectedEndDay != null) {
        if (isSameDay(selectedDay, _selectedStartDay)) {
          _selectedStartDay = null;
          _selectedEndDay = null;
          _selectedRange = [];
        } else if (isSameDay(selectedDay, _selectedEndDay)) {
          _selectedEndDay = null;
          _selectedRange = [_selectedStartDay!];
        } else if (selectedDay.isBefore(_selectedStartDay!)) {
          _selectedStartDay = selectedDay;
          _selectedEndDay = null;
          _selectedRange = [selectedDay];
        } else if (selectedDay.isAfter(_selectedStartDay!)) {
          bool hasUnavailableDates = false;
          for (DateTime date = _selectedStartDay!;
              date.isBefore(selectedDay.add(const Duration(days: 1)));
              date = date.add(const Duration(days: 1))) {
            if (!_isDateAvailable(date)) {
              hasUnavailableDates = true;
              break;
            }
          }
          if (!hasUnavailableDates) {
            _selectedEndDay = selectedDay;
            _selectedRange = [];
            for (DateTime date = _selectedStartDay!;
                date.isBefore(selectedDay.add(const Duration(days: 1)));
                date = date.add(const Duration(days: 1))) {
              _selectedRange.add(date);
            }
          }
        }
      }
      _focusedDay = focusedDay;
    });

    // Trigger the FlutterFlow action when dates are selected
    if (widget.onSelectedDatesChanged != null) {
      await widget.onSelectedDatesChanged!(
          _selectedRange); // Pass the selected dates as a parameter
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      color: Colors.white, // Added background color to avoid grey appearance
      child: TableCalendar(
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return _selectedRange.contains(day);
        },
        onDaySelected: _onDaySelected,
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            if (!_isDateAvailable(day)) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.grey),
                ),
              );
            } else {
              return Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.green),
                ),
              );
            }
          },
          selectedBuilder: (context, date, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: _selectedRange.contains(date) ? Colors.orange : null,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          todayBuilder: (context, date, focusedDay) {
            final isAvailable = _isDateAvailable(date);
            return Container(
              margin: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.purple, width: 2),
                ),
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                      color: isAvailable ? Colors.green : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          outsideBuilder: (context, date, focusedDay) {
            return Center(
              child: Text(
                '${date.day}',
                style: TextStyle(color: Colors.grey[300]),
              ),
            );
          },
        ),
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        locale: 'pt_BR',
        headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
      ),
    );
  }
}
