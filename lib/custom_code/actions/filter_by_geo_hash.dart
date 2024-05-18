// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final GeoFlutterFire _geo = GeoFlutterFire();

Future<List<DocumentReference>> filterByGeoHash(BuildContext context,
    LatLng userLatLng, double radius, GamesRecord gameObject) async {
  // Generate geohash for the user's location
  GeoFirePoint center = _geo.point(
      latitude: userLatLng.latitude, longitude: userLatLng.longitude);

  // Get the list of users who have this game available
  var availableAt = gameObject.availableAt as List<dynamic>;
  var availableAtGeoHash = gameObject.availableAtGeoHash as List<dynamic>;
  List<LatLng> availableAtLatLng = gameObject.availableAtLatLng;

  // Use the geohash to narrow down the search area
  String centerGeohash = center.hash;
  int geohashPrecision = centerGeohash.length;

  // Collect user references and fetch additional info
  List<DocumentReference> results = [];
  for (int i = 0; i < availableAt.length; i++) {
    var userRef = availableAt[i] as DocumentReference;

    // Get user document
    var userDoc = await userRef.get();

    // Get user's coordinates and geohash
    double userLatitude = availableAtLatLng[i].latitude;
    double userLongitude = availableAtLatLng[i].longitude;
    String userGeohash = availableAtGeoHash[i];

    // Check if the user's geohash is within the proximity filter
    if (userGeohash.substring(0, geohashPrecision) ==
        centerGeohash.substring(0, geohashPrecision)) {
      // Create GeoFirePoint from user's coordinates for precise distance calculation
      GeoFirePoint userPoint =
          _geo.point(latitude: userLatitude, longitude: userLongitude);

      if (userPoint.distance(
              lat: userLatLng.latitude, lng: userLatLng.longitude) <=
          radius) {
        // Fetch user's available dates and price from subcollection
        results.add(userDoc as DocumentReference<Object?>);
      }
    }
  }

  return results;
}
