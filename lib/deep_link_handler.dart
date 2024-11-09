// deep_link_handler.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import '/backend/schema/games_record.dart';

// Logger instance for logging
final Logger _logger = Logger();

/// Query a game object by document ID in Firestore and return a `GamesRecord` object.
Future<GamesRecord?> _queryGameObject(String gameId) async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('games').doc(gameId).get();
    if (doc.exists) {
      return GamesRecord.fromSnapshot(doc);
    }
  } catch (e) {
    _logger.w("Error fetching game object: $e");
  }
  return null; // Return null if not found or error occurs
}

/// Get the Firestore document reference for the authenticated user.
Future<DocumentReference?> _getAuthenticatedUserRef() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    return FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
  }
  _logger.w("No authenticated user found.");
  return null;
}

/// Handle incoming URI and determine route and parameters based on URI path.
Future<Map<String, dynamic>?> handleIncomingUri(Uri uri) async {
  if (uri.pathSegments.isEmpty) return null;

  String pageType = uri.pathSegments[0];
  String pageId = uri.pathSegments.length > 1 ? uri.pathSegments[1] : '';

  switch (pageType) {
    case 'jogos':
      if (pageId.isNotEmpty) {
        return {'route': '/jogos/$pageId', 'extra': {'gameName': pageId}};
      }
      break;

    case 'addProfilePersonalInfo':
      final userRef = await _getAuthenticatedUserRef();
      if (userRef != null) {
        return {'route': '/addProfilePersonalInfo', 'extra': {'userRef': userRef}};
      }
      break;

    case 'toRentList':
      if (pageId.isNotEmpty) {
        final gameObject = await _queryGameObject(pageId);
        if (gameObject != null) {
          return {'route': '/toRentList', 'extra': {'gameObject': gameObject}};
        }
      }
      break;

    case 'homePage':
      return {'route': '/homePage'};

    case 'login':
      return {'route': '/login'};

    case 'addProfileAddress':
      return {'route': '/addProfileAddress'};

    case 'addProfileGames':
      return {'route': '/addProfileGames'};

    case 'addProfilePicture':
      return {'route': '/addProfilePicture'};

    case 'addProfilePhoneNumber':
      return {'route': '/addProfilePhoneNumber'};

    case 'addProfileCodeConfirmation':
      return {'route': '/addProfileCodeConfirmation'};

    case 'gamesList':
      return {'route': '/gamesList'};

    case 'profile':
      return {'route': '/profile'};

    case 'addProfileAddress2':
      return {'route': '/addProfileAddress2'};

    case 'signUp':
      return {'route': '/signUp'};

    case 'dashboardResponsive':
      return {'route': '/dashboardResponsive'};

    case 'gamelist':
      return {'route': '/gamelist'};

    case 'myGames':
      return {'route': '/myGames'};

    case 'myCart':
      return {'route': '/myCart'};

    case 'payment01':
      return {'route': '/payment01'};

    case 'checkout':
      return {'route': '/checkout'};

    case 'saveActions':
      return {'route': '/saveActions'};

    case 'addGames':
      return {'route': '/addGames'};

    case 'loginLudopedia':
      return {'route': '/loginLudopedia'};

    case 'deliveryStatus':
      return {'route': '/deliveryStatus'};

    case 'termandconditions':
      return {'route': '/termandconditions'};

    case 'changePassword':
      return {'route': '/changePassword'};

    case 'settings1Notifications':
      return {'route': '/settings1Notifications'};

    case 'settings2EditProfile':
      return {'route': '/settings2EditProfile'};

    case 'settingsListAddress':
      return {'route': '/settingsListAddress'};

    default:
      return {'route': '/homePage'};
  }

  return null; // Return null if no route is matched
}
