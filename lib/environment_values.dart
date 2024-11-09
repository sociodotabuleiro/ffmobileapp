import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sociodotabuleiro/backend/schema/structs/address_struct.dart';

import 'app_constants.dart';

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

   void checkCityForRentingAvailability(AddressStruct address) {
    // Check if the user's city is in the allowed cities list
    if (FFAppConstants.cities2Rent.contains(address.city.toLowerCase())) {
      _isRentingAvailable = true;
    } else {
      _isRentingAvailable = false;
    }
  }

}

