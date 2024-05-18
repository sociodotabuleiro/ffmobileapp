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

import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:firebase_auth/firebase_auth.dart';

final geo = GeoFlutterFire();

Future getGeohash(
  BuildContext context,
  LatLng latLng,
) async {
  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // Generate the GeoFirePoint
    GeoFirePoint geoData = geo.point(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
    );

    String geohash = geoData.hash;

    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'address.geohash': geohash,
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }
}
