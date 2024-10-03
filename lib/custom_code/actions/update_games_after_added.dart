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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/auth/firebase_auth/auth_util.dart' as auth_util;

Future updateGamesAfterAdded(
  List<DocumentReference> gamesAvailableToRent,
) async {
  // receive a list of games, updating the collection "games" in firebase, changing the fields availableToRent to true, adding one to quantityAvailable, and inserting in the array the logged in user's reference in availableAt
// Import necessary packages and files

// Get the current user's reference
  final userRef = auth_util.currentUserReference;

// Get the user's document snapshot
  final userSnapshot = await userRef!.get();

  // Initialize variables for geohash and latlng
  String? geohash;
  GeoPoint? latlng;

  // Check if the document exists
  if (userSnapshot.exists) {
    // Access the fields within the document
    final userData = userSnapshot.data() as Map<String, dynamic>;
    // Retrieve the Address object
    final Map<String, dynamic> addressData = userData['address'];

    // Retrieve the geohash and latlng fields from the Address object
    final String geohash = addressData['geohash'];
    final GeoPoint latlng = addressData['coordinates'];
  } else {
    print('User document does not exist');
  }

  // Loop through the list of games and update each game's fields
  for (int i = 0; i < gamesAvailableToRent.length; i++) {
    // Get the game's reference
    final gameRef = gamesAvailableToRent[i];

    // Update the game's fields within a transaction
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final gameSnapshot = await transaction.get(gameRef);

        if (!gameSnapshot.exists) {
          throw Exception('Game document does not exist');
        }

        // Retrieve current data to ensure array initialization
        final gameData = gameSnapshot.data() as Map<String, dynamic>;
        List<String> currentGeohashes =
            gameData['availableAtGeoHash']?.cast<String>() ?? [];
        List<GeoPoint> currentLatLngs =
            gameData['availableAtLatLng']?.cast<GeoPoint>() ?? [];
        List<DocumentReference> currentUsers =
            gameData['availableAt']?.cast<DocumentReference>() ?? [];

        // Update the game document
        transaction.update(gameRef, {
          'availableToRent': true,
          'quantityAvailable': FieldValue.increment(1),
          'availableAt': FieldValue.arrayUnion([...currentUsers, userRef]),
          'availableAtGeoHash':
              FieldValue.arrayUnion([...currentGeohashes, geohash]),
          'availableAtLatLng':
              FieldValue.arrayUnion([...currentLatLngs, latlng]),
        });
      });

      debugPrint('Game document updated successfully.');
    } catch (error) {
      debugPrint('Failed to update game document: $error');
    }
  }
}
