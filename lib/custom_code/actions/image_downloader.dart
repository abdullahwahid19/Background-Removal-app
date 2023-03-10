// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_downloader_web/image_downloader_web.dart';

Future imageDownloader(String? url) async {
  // download image from url and save locally

  if (url != null) {
    await WebImageDownloader.downloadImageFromWeb(
      url,
      name: 'Car-Cutter',
      imageType: ImageType.png,
    );
  }
}
