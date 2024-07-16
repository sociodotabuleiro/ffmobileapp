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

Future<List<DocumentReference>> searchGameLists(String gameName) async {
  // Get the Firestore instance
  final firestoreInstance = FirebaseFirestore.instance;

  try {
    // Create a query to search for documents with the searched string in their name
    final query = firestoreInstance
        .collection('games')
        .where('name', isGreaterThanOrEqualTo: gameName)
        .where('name', isLessThanOrEqualTo: gameName + '\uf8ff');

    // Execute the query and get the results
    final querySnapshot = await query.get();

    // Extract the document references from the query snapshot
    final documentReferences =
        querySnapshot.docs.map((doc) => doc.reference).toList();

    // Return the document references
    return documentReferences;
  } catch (e) {
    print('Error searching game lists: $e');
    return [];
  }
}
