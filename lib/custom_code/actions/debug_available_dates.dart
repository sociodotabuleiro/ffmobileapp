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

Future debugAvailableDates(String documentPath) async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.doc(documentPath).get();
    if (doc.exists) {
      List<dynamic> availableDates = doc['availableDates'];
      for (var date in availableDates) {
        if (date is Timestamp) {
          DateTime dateTime = date.toDate();
          print('Retrieved DateTime: $dateTime');
        } else {
          print('Invalid Timestamp found: $date');
        }
      }
    } else {
      print('Document does not exist.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
