// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_downloader_web/image_downloader_web.dart';

Future imageDownloader(String? url) async {
  // Add your function code here!
  if (url != null) {
    await WebImageDownloader.downloadImageFromWeb(url);
  }
}
