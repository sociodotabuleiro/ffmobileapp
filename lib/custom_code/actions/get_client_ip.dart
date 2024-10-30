// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getClientIp() async {
  try {
    // Send request to get the public IP address
    final response =
        await http.get(Uri.parse('https://api64.ipify.org?format=json'));

    // If the request is successful
    if (response.statusCode == 200) {
      // Parse the response body
      final data = jsonDecode(response.body);
      return data['ip']; // Returns the IP address
    } else {
      throw Exception('Failed to get IP address');
    }
  } catch (e) {
    print('Error: $e');
    return 'Error fetching IP';
  }
}
