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
import 'dart:io';
import 'package:http/http.dart' as http;

// Constants for URLs and headers
const lalamoveUrl = 'https://rest.lalamove.com/v3/quotations';
const hmacUrl = 'https://generatehmac-667069547103.us-central1.run.app';
const internal_access_code =
    'jq3uaqXXne5c431XFeLmLusHkQD0EqDn'; // Your secret access code

Future<dynamic> getQuotationLalaMove(
  String lat1,
  String lng1,
  String lat2,
  String lng2,
  String address1,
  String address2,
) async {
  try {
    // Prepare request body for Lalamove quotation
    final requestBody = jsonEncode({
      "auth_token": internal_access_code,
      "data": {
        "serviceType": "LALAGO", // Service type for your market
        "language": "pt_BR", // Language setting for Brazil
        "stops": [
          {
            "coordinates": {"lat": lat1, "lng": lng1},
            "address": address1
          },
          {
            "coordinates": {"lat": lat2, "lng": lng2},
            "address": address2
          }
        ],
        "item": {
          "quantity": "1",
          "weight": "LESS_THAN_3KG",
          "handlingInstructions": ["KEEP_UPRIGHT"]
        }
      }
    });

    // Call your cloud function
    final response = await http.post(
      Uri.parse(
          'https://getquotationlalamove-667069547103.us-central1.run.app'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return responseData['data']; // Contains the quotation response
    } else {
      print('Failed to get quotation. Status code: ${response.statusCode}');
      print('Error: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Error during Lalamove quotation process: $error');
    return null;
  }
}
