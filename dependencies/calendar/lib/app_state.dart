import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DateTime> _datesAvailable = [
    DateTime.fromMillisecondsSinceEpoch(1727362800000),
    DateTime.fromMillisecondsSinceEpoch(1727449200000),
    DateTime.fromMillisecondsSinceEpoch(1727535600000),
    DateTime.fromMillisecondsSinceEpoch(1727808600000),
    DateTime.fromMillisecondsSinceEpoch(1727895000000),
    DateTime.fromMillisecondsSinceEpoch(1728154200000)
  ];
  List<DateTime> get datesAvailable => _datesAvailable;
  set datesAvailable(List<DateTime> value) {
    _datesAvailable = value;
  }

  void addToDatesAvailable(DateTime value) {
    datesAvailable.add(value);
  }

  void removeFromDatesAvailable(DateTime value) {
    datesAvailable.remove(value);
  }

  void removeAtIndexFromDatesAvailable(int index) {
    datesAvailable.removeAt(index);
  }

  void updateDatesAvailableAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    datesAvailable[index] = updateFn(_datesAvailable[index]);
  }

  void insertAtIndexInDatesAvailable(int index, DateTime value) {
    datesAvailable.insert(index, value);
  }
}
