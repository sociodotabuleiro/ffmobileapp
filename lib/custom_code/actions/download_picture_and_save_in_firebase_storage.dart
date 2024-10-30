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

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_storage/firebase_storage.dart';

Future<String> downloadPictureAndSaveInFirebaseStorage(
    String pictureUrl) async {
  // Get the current user
  fb_auth.User? user = fb_auth.FirebaseAuth.instance.currentUser;
  if (user == null) {
    print('No user is currently logged in.');
    return 'No user is currently logged in.';
  }

  // Generate the file name using the user reference
  String fileName = '${user.uid}.png';

  // Get the temporary directory
  final Directory tempDir = await getTemporaryDirectory();
  final File file = File('${tempDir.path}/$fileName');

  // Download the image
  final http.Response response = await http.get(Uri.parse(pictureUrl));
  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);

    // Upload to Firebase Storage
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference storageRef =
        storage.ref().child('public/profiles/$fileName');

    try {
      await storageRef.putFile(file);
      print('File uploaded successfully');
      // Get the public URL
      String downloadUrl = await storageRef.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      return 'Error occurred while uploading: ${e.message}';
    }
  } else {
    return 'Failed to download image: ${response.statusCode}';
  }
}
