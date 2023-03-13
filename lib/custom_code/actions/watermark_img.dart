// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_watermark/image_watermark.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<List<String>> watermarkImg(
    dynamic img, dynamic logo, String pos, String name) async {
  var positions = {
    "Top Right": [0, 0],
    "Top Left": [100, 0],
    "Bottom Right": [0, 100],
    "Bottom Left": [100, 100]
  };

  if ((img != Uint8List(0)) && (logo != Uint8List(0))) {
    var newImg = await ImageWatermark.addImageWatermark(
        //image bytes
        originalImageBytes: img,
        waterkmarkImageBytes: logo,
        imgHeight: 200,
        imgWidth: 200,
        dstY: (positions[pos])![0],
        dstX: (positions[pos])![1]);

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User is not authenticated, handle this error
      return [
        "https://www.adobe.com/express/feature/image/media_16ad2258cac6171d66942b13b8cd4839f0b6be6f3.png?width=750&format=png&optimize=medium"
      ];
    }

    var nameog = name + '.jpg';
    var nameedit = name + 'edit.jpg';

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(currentUser.uid)
        .child(nameog);

    final uploadTask = storageRef.putData(img);
    final snapshot = await uploadTask.whenComplete(() {});
    final orignalUrl = await snapshot.ref.getDownloadURL();

    final storageRef2 = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(currentUser.uid)
        .child(nameedit);

    final uploadTask2 = storageRef2.putData(newImg);
    final snapshot2 = await uploadTask2.whenComplete(() {});
    final downloadUrl = await snapshot2.ref.getDownloadURL();
    return [orignalUrl, downloadUrl];
  }

  return [
    "https://upload.wikimedia.org/wikipedia/commons/b/bb/Gorgosaurus_BW_transparent.png"
  ];
}
