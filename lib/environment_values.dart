import 'dart:convert';
import 'package:flutter/services.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/production.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _isRentingAvailable = data['isRentingAvailable'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  bool _isRentingAvailable = false;
  bool get isRentingAvailable => _isRentingAvailable;
}
