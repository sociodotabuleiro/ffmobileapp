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
import 'dart:developer' as developer;

Future<List<DocumentReference>> get5gamesWithGoodBggRank() async {
  List<DocumentReference> gameRefs = [];
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('games')
        .where('bggRating', isGreaterThan: 8)
        .limit(20) // Fetch more games for better randomness
        .get();

    querySnapshot.docs.forEach((doc) {
      gameRefs.add(doc.reference);
    });
    developer.log('Games fetched: ${gameRefs.length}',
        name: 'sociodotabuleiro.app');

    gameRefs.shuffle(Random());
    return gameRefs.take(5).toList();
  } catch (e) {
    developer.log('Error fetching games: $e',
        name: 'sociodotabuleiro.app', error: e);
    return [];
  }
}
