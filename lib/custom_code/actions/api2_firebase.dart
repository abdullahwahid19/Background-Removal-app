// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_watermark/image_watermark.dart';

Future<String> api2Firebase(String uploadedImage, String? selectedColor,
    String? selectedBg, String randFileName) async {
  // Add your function code here!
  final apiKey = 'dd78DWGUQY3MA6xVg8czSiyH';
  final url = Uri.parse('https://api.remove.bg/v1.0/removebg');
  final response = await http.post(
    url,
    headers: {'X-Api-Key': apiKey},
    body: {
      'image_url': uploadedImage,
      'bg_color': selectedColor,
      'bg_image_url': selectedBg
    },
  );

  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;

    final fileName = randFileName + '.png';

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User is not authenticated, handle this error
      return "";
    }

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(currentUser.uid)
        .child(fileName);

    final uploadTask = storageRef.putData(bytes);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;

    // Use the downloadUrl to display the image or save it to a database
  } else {
    print('Error ${response.statusCode}: ${response.reasonPhrase}');
    return "";
  }
}
