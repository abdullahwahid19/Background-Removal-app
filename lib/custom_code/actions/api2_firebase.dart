// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_storage/firebase_storage.dart';

Future<String> api2Firebase(
  dynamic apiImage,
  String? userID,
) async {
  // Add your function code here!
  final Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('users/${userID}/designs/${DateTime.now()}.jpg');
  final UploadTask uploadTask = storageReference.putData(apiImage);
  final TaskSnapshot downloadUrl = (await uploadTask);
  final String url = (await downloadUrl.ref.getDownloadURL());
  return url;
}
