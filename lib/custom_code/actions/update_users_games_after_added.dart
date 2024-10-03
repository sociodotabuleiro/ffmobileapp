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
import '/auth/firebase_auth/auth_util.dart' as auth_util;

Future<List<DocumentReference>> updateUsersGamesAfterAdded(
  List<DocumentReference> gamesAvailableToRent,
  List<DocumentReference> allGames,
  List<double> values,
) async {
  final userRef = auth_util.currentUserReference;
  if (userRef == null) return [];

  final myGamesCollectionRef = userRef.collection('myGames');
  final myGamesSnapshot = await myGamesCollectionRef.get();

  // Create a map for quick lookup of existing games
  final existingGamesMap = {
    for (var doc in myGamesSnapshot.docs)
      (doc['gameRef'] as DocumentReference).path: doc
  };

  // Generate a list of available dates from today to 30 days later with time set to 00:00:00
  final List<Timestamp> availableDates = List.generate(
    30,
    (index) {
      DateTime date = DateTime.now().add(Duration(days: index));
      DateTime dateAtMidnight =
          DateTime(date.year, date.month, date.day); // Set time to 00:00:00
      return Timestamp.fromDate(dateAtMidnight);
    },
  );

  // Prepare the batch
  final WriteBatch batch = FirebaseFirestore.instance.batch();

  final List<DocumentReference> myGamesRefs = [];
  final List<DocumentReference> myGamesIds = [];

  for (int i = 0; i < allGames.length; i++) {
    final gameRef = allGames[i];
    final bool toRent = gamesAvailableToRent.contains(gameRef);
    final double price = values[i];
    final String publicId = _generateUniquePublicId();

    final existingGameDoc = existingGamesMap[gameRef];

    if (existingGameDoc != null) {
      // Update existing game
      batch.update(existingGameDoc.reference, {
        'availableDates': availableDates,
        'price': price,
        'toRent': true,
        'publicId': publicId,
      });
    } else {
      // Add new game
      final newGameRef = myGamesCollectionRef.doc();
      batch.set(newGameRef, {
        'gameRef': gameRef,
        'availableDates': availableDates,
        'price': price,
        'toRent': toRent,
        'publicId': publicId,
      });
      // Add the reference and ID to the lists
      myGamesIds.add(newGameRef);
      myGamesRefs.add(gameRef);
    }
  }

  // Append the new references and IDs to the existing ones in FFAppState
  FFAppState().myGamesId = [
    ...FFAppState().myGamesId,
    ...myGamesIds,
  ];
  FFAppState().myGamesRef = [
    ...FFAppState().myGamesRef,
    ...myGamesRefs,
  ];

  // Commit the batch
  await batch.commit();

  return myGamesRefs;
}

// Helper function to generate a unique 5-digit public ID
String _generateUniquePublicId() {
  final random = Random();
  return (10000 + random.nextInt(90000)).toString();
}
