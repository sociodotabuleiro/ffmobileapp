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

Future<DocumentReference?> getMyGamesRefFromGamesId(
    DocumentReference gameRef) async {
  final currentGameRef = gameRef;

  // Find the index of the current game reference in myGamesRef list
  int index =
      FFAppState().myGamesGameRef.indexWhere((ref) => ref == currentGameRef);

  // Check if the index is valid, then retrieve the myGamesId at the same index
  if (index >= 0){
    final myGameId = FFAppState().myGamesId[index];
    return myGameId;
  }
  return null;
}
