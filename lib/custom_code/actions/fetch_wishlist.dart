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

Future fetchWishlist(
    BuildContext context, DocumentReference userDocument) async {
  try {
    // Reference to the user's WISHLIST subcollection
    CollectionReference wishlistRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userDocument.id)
        .collection('wishlist');

    // Get the wishlist documents
    QuerySnapshot querySnapshot = await wishlistRef.get();

    // Prepare the JSON object to update the state
    Map<String, dynamic> newWishlist = {};
    querySnapshot.docs.forEach((doc) {
      DocumentReference gameRef = doc.get('gameReference');
      newWishlist[doc.id] = gameRef;
    });

    // Update the app state (Assuming you have a state management solution set up)
    FFAppState().wishlistedGames = newWishlist;
  } catch (e) {
    print('Error fetching wishlist: $e');
  }
}
