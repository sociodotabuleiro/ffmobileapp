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

Future<dynamic> callDriverLalamove(
  List<StopsStruct> stops,
  String quotationId,
  String pickupName,
  String pickupPhone,
  String deliveryName,
  String deliveryPhone,
  String orderId,
) async {
  try {
    // Prepare the request body
    final requestBody = {
      "auth_token":
          "PS4qe1JWbHgpGFLtj5SyR21UkM5WL3QN", // Replace with securely managed APP_SECRET_KEY
      "quotationId": quotationId,
      "sender": {
        "stopId": stops[0].stopId, // Assuming stops[0] is the sender stop
        "name": pickupName,
        "phone": pickupPhone,
      },
      "recipients": [
        {
          "stopId": stops[1].stopId, // Assuming stops[1] is the recipient stop
          "name": deliveryName,
          "phone": deliveryPhone,
          "remarks": "Por favor lidar com cuidado", // Optional, adjust as needed
        }
      ],
      "isPODEnabled": false, // Optional, set to true if proof of delivery is required
      "metadata": {
        "orderId": orderId, // Your custom order ID or metadata
      }
    };

    // Make the API request to your cloud function
    final response = await http.post(
      Uri.parse('https://placeorderlalamove-667069547103.us-central1.run.app'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    // Handle the response
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return responseData['data']; // Return the successful response data
    } else {
      print('Failed to place order. Status code: ${response.statusCode}');
      print('Error: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Error during Lalamove order placement: $error');
    return null;
  }
}
