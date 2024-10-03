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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final GeoFlutterFire _geo = GeoFlutterFire();

Future<List<DocumentReference>> filterByGeoHash(BuildContext context,
    LatLng userLatLng, double radius, GamesRecord gameObject) async {
  // Generate GeoFirePoint for the user's location
  GeoFirePoint center = _geo.point(
      latitude: userLatLng.latitude, longitude: userLatLng.longitude);

  // Initialize the list to store results
  List<DocumentReference> results = [];

  // Iterate over available locations
  for (int i = 0; i < gameObject.availableAt.length; i++) {
    DocumentReference userRef = gameObject.availableAt[i];
    LatLng userLatLng = gameObject.availableAtLatLng[i];
    String userGeohash = gameObject.availableAtGeoHash[i];

    // Create GeoFirePoint for user's coordinates
    GeoFirePoint userPoint = _geo.point(
        latitude: userLatLng.latitude, longitude: userLatLng.longitude);

    // Check geohash proximity and distance
    if (userPoint.hash.startsWith(center.hash.substring(0, 5)) &&
        userPoint.distance(
                lat: userLatLng.latitude, lng: userLatLng.longitude) <=
            radius) {
      results.add(userRef);
    }
  }

  return results;
}
