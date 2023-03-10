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

Future<String> watermarkImg(
  String img,
  String logo,
) async {
  Uint8List bytesImg = Uint8List(0);
  Uint8List bytesLogo = Uint8List(0);
  try {
    var bytesImg = await FirebaseStorage.instance.ref(img).getData()!;
  } on FirebaseException catch (e) {
    print('Error loading image from Firebase Storage: $e');
  } on IOException catch (e) {
    print('Error loading image from Firebase Storage: $e');
  }

  try {
    var bytesLogo = await FirebaseStorage.instance.ref(logo).getData()!;
  } on FirebaseException catch (e) {
    print('Error loading image from Firebase Storage: $e');
  } on IOException catch (e) {
    print('Error loading image from Firebase Storage: $e');
  }
  if ((bytesImg != Uint8List(0)) && (bytesLogo != Uint8List(0))) {
    var newImg = await ImageWatermark.addImageWatermark(
        //image bytes
        originalImageBytes: bytesImg,
        waterkmarkImageBytes: bytesLogo,
        imgHeight: 200,
        imgWidth: 200,
        dstY: 0,
        dstX: 0);

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // User is not authenticated, handle this error
      return "https://www.adobe.com/express/feature/image/media_16ad2258cac6171d66942b13b8cd4839f0b6be6f3.png?width=750&format=png&optimize=medium";
    }

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(currentUser.uid)
        .child("watermarked.jpg");

    final uploadTask = storageRef.putData(newImg);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  return "https://upload.wikimedia.org/wikipedia/commons/b/bb/Gorgosaurus_BW_transparent.png";
}
