// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

Future<Uint8List?> api2Firebase(Uint8List uploadedImage, String? selectedColor,
    Uint8List? selectedBg) async {
  // Add your function code here!
  final apiKey = 'dd78DWGUQY3MA6xVg8czSiyH';
  final url = Uri.parse('https://api.remove.bg/v1.0/removebg');
  final currentUser = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance
      .ref()
      .child('users')
      .child(currentUser!.uid)
      .child('tempImg');
  final uploadTask = storageRef.putData(uploadedImage);
  final snapshot = await uploadTask.whenComplete(() {});
  final imgUrl = await snapshot.ref.getDownloadURL();
  String bgUrl = '';
  if (selectedBg != null) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(currentUser!.uid)
        .child('temp');
    final uploadTask = storageRef.putData(selectedBg);
    final snapshot = await uploadTask.whenComplete(() {});
    bgUrl = await snapshot.ref.getDownloadURL();
  }
  final response = await http.post(
    url,
    headers: {'X-Api-Key': apiKey},
    body: {
      'image_url': imgUrl,
      'bg_color': selectedColor,
      'bg_image_url': bgUrl
    },
  );

  if (response.statusCode == 200) {
    final bytes = response.bodyBytes;
    return bytes;
  }
  // Use the downloadUrl to display the image or save it to a database
  else {
    print('Error ${response.statusCode}: ${response.reasonPhrase}');
    return null;
  }
}
