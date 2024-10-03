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
const accessCode =
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

    // Get the current Unix timestamp in milliseconds
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    // Step 1: Fetch HMAC authorization token
    final authorizationToken = await getAuthorizationToken(
      timestamp,
      'POST',
      '/v3/quotations',
      requestBody,
    );

    if (authorizationToken == null) {
      print('Failed to retrieve authorization token');
      return null;
    }

    // Step 2: Make the Lalamove API request with the authorization token
    final response = await http.post(
      Uri.parse(lalamoveUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authorizationToken,
      },
      body: requestBody,
    );

    return _handleLalamoveResponse(response);
  } catch (error) {
    print('Error during Lalamove quotation process: $error');
    return null;
  }
}

// Helper function to get HMAC authorization token
Future<String?> getAuthorizationToken(
  String timestamp,
  String method,
  String path,
  String body,
) async {
  try {
    // Create the request body for the HMAC generation service
    final hmacRequestBody = jsonEncode({
      'timestamp': timestamp,
      'method': method,
      'path': path,
      'body': body,
    });

    // Send the request to get the HMAC signature
    final response = await http.post(
      Uri.parse(hmacUrl),
      headers: {
        'Content-Type': 'application/json',
        'access_code': accessCode,
      },
      body: hmacRequestBody,
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['authorization'];
    } else {
      print(
          'Failed to retrieve HMAC signature. Status code: ${response.statusCode}');
      print('Error: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Error during HMAC token generation: $error');
    return null;
  }
}

// Helper function to handle Lalamove response
dynamic _handleLalamoveResponse(http.Response response) {
  if (response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    print('Quotation Created: ${responseData['data']['quotationId']}');
    print('Price: ${responseData['data']['priceBreakdown']['total']}');
    print('Currency: ${responseData['data']['priceBreakdown']['currency']}');
    return responseData;
  } else {
    print('Failed to get quotation. Status code: ${response.statusCode}');
    print('Error: ${response.body}');
    return null;
  }
}

// Helper function to format user address
String formatAddress(dynamic address) {
  return '${address.street}, ${address.number} - ${address.neighborhood}, ${address.city} - ${address.state}';
}
