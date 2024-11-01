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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateHMAC(
    String userId, String method, String path, String? body) async {
  // Send the userId and hash to your Cloud Run endpoint
  String bodyFinal = body ?? "";
  final response = await http.post(
    Uri.parse('https://generatehmac-667069547103.us-central1.run.app'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'internal_access_code': 'jq3uaqXXne5c431XFeLmLusHkQD0EqDn',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'method': method,
      'path': path,
      'body': bodyFinal
    }),
  );

  if (response.statusCode == 200) {
    // Extract the authorization token from the response
    final responseData = jsonDecode(response.body);
    final authorizationToken = responseData['authorization'];

    // Update FFAppState with the received token
    FFAppState().currentHmacAuth = authorizationToken;

    print('Hash verification succeeded: $authorizationToken');
    return authorizationToken;
  } else {
    print('Hash verification failed: ${response.body}');
    return '0';
  }
}
