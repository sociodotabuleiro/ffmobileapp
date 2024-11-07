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
    final requestBody = {
      "auth_token":
          "PS4qe1JWbHgpGFLtj5SyR21UkM5WL3QN", // Replace with your APP_SECRET_KEY
      "body": {
        "quotationId": quotationId,
        "sender": {
          "name": pickupName,
          "phone": pickupPhone,
        },
        "recipients": [
          {
            "stopId":
                stops[1].stopId, // Assuming stops[1] is the recipient stop
            "name": deliveryName,
            "phone": deliveryPhone,
            "remarks": "Por favor lidar com cuidado",
          }
        ],
        "isPODEnabled": false,
        "metadata": {
          "orderId": orderId, // Your custom order ID or metadata
        }
      }
    };

    // Call your cloud function
    final response = await http.post(
      Uri.parse('https://placeorderlalamove-667069547103.us-central1.run.app'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      return responseData['data']; // Contains the order response
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
