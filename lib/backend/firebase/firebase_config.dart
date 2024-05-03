import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAwgW5Q1x468KTtSvhmUYi_cUet1zJUO_U",
            authDomain: "sociodotabuleiro-main.firebaseapp.com",
            projectId: "sociodotabuleiro-main",
            storageBucket: "sociodotabuleiro-main.appspot.com",
            messagingSenderId: "667069547103",
            appId: "1:667069547103:web:0a099f5bb553e6f2cc11ea",
            measurementId: "G-3KYMY7ESC5"));
  } else {
    await Firebase.initializeApp();
  }
}
