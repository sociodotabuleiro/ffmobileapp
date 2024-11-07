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

import 'package:geocoding/geocoding.dart';
import '/flutter_flow/lat_lng.dart'; // Importing the FlutterFlow LatLng class

Future<LatLng> getLatLngGivenAddress(String address) async {
  List<Location> locations = await locationFromAddress(address);
  LatLng latLng = LatLng(locations.first.latitude, locations.first.longitude);
  return latLng;
}
