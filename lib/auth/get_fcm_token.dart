import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addFcmTokenIfNotExists(String fcmToken, String deviceType) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("User is not logged in");
    return;
  }

  final userDocPath = "users/${user.uid}";

  // Check if `fcm_tokens` subcollection exists for this user
  final fcmTokensCollection = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid)
      .collection("fcm_tokens");

  final querySnapshot = await fcmTokensCollection.limit(1).get();

  // If there are no documents in `fcm_tokens`, add the token
  if (querySnapshot.docs.isEmpty) {
    print("No FCM token found, calling the function to add token.");

    try {
      final functions = FirebaseFunctions.instanceFor(region: "us-central1");
      final addFcmTokenFunction = functions.httpsCallable("addFcmToken");

      final result = await addFcmTokenFunction.call({
        "userDocPath": userDocPath,
        "fcmToken": fcmToken,
        "deviceType": deviceType,
      });

      print("Function result: ${result.data}");
    } catch (e) {
      print("Error calling addFcmToken function: $e");
    }
  } else {
    print("FCM token already exists for this user. No action needed.");
  }
}
