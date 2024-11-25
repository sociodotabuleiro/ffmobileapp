import '/flutter_flow/flutter_flow_util.dart';


void listenToNotifications(String userId) {
  final userNotificationsRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('notifications');

  // Set up the real-time listener
  userNotificationsRef.snapshots().listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final notifications = snapshot.docs.map((doc) {
        return doc.reference; // Get the DocumentReference
      }).toList();

      // Update the app state with the new notifications
      FFAppState().notifications = notifications;

      //check for each notification if it's read or not
      for (final notification in notifications) {
        notification.get().then((doc) {
          if (!doc.exists) return;
          final data = doc.data();
          if (data == null) return;
          if (data['read'] == false) {
            FFAppState().incrementUnreadNotificationsCount();
          }
        });
      }

    } else {
      // If no notifications, clear the app state
      FFAppState().notifications = [];
    }
  });
}
