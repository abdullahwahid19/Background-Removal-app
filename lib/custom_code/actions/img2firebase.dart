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

Future<String> img2firebase(Uint8List uploadedImage, String rand) async {
  // Add your function code here!
  final currentUser = FirebaseAuth.instance.currentUser;
  final storageRef = FirebaseStorage.instance
      .ref()
      .child('users')
      .child(currentUser!.uid)
      .child(rand);
  final uploadTask = storageRef.putData(uploadedImage);
  final snapshot = await uploadTask.whenComplete(() {});
  final downloadURL = await snapshot.ref.getDownloadURL();
  return downloadURL;
}
