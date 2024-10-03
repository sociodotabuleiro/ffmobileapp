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

import 'dart:math';

Future<double> distanceBetween2Points(
  double lat1,
  double lng1,
  double lat2,
  double lng2,
) async {
  const earthRadius = 6371.0; // Earth radius in kilometers

  double dLat = _toRadians(lat2 - lat1);
  double dLng = _toRadians(lng2 - lng1);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_toRadians(lat1)) *
          cos(_toRadians(lat2)) *
          sin(dLng / 2) *
          sin(dLng / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distanceInKm = earthRadius * c;

  // Now we map this distance to a range of 0 to 5
  return _mapDistanceToRange(distanceInKm);
}

double _toRadians(double degree) {
  return degree * pi / 180;
}

// Map distance to the range of 0 to 5 (assuming max distance in the city is 10 km)
double _mapDistanceToRange(double distanceInKm) {
  const maxDistance = 15.0; // Define the maximum distance that maps to 5
  if (distanceInKm >= maxDistance) {
    return 5;
  }
  return (distanceInKm / maxDistance) * 5;
}
