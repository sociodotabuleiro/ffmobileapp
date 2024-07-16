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

Future fetchCart(BuildContext context, DocumentReference userDocument) async {
  try {
    // Reference to the user's WISHLIST subcollection
    CollectionReference fetchCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userDocument.id)
        .collection('cart');

    // Get the wishlist documents
    QuerySnapshot querySnapshot = await fetchCartRef.get();

    // Prepare the JSON object to update the state
    Map<String, dynamic> newfetchCart = {};
    querySnapshot.docs.forEach((doc) {
      DocumentReference gameRef = doc.get('gameReference');
      newfetchCart[doc.id] = gameRef;
    });

    // Update the app state (Assuming you have a state management solution set up)
    FFAppState().myCart = newfetchCart;
  } catch (e) {
    print('Error fetching cart List: $e');
  }
}
