// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // for base64 encoding/decoding
import 'dart:typed_data'; // for handling byte data

Future<FFUploadedFile?> convertFromBase64(String base64String) async {
  if (base64String.isEmpty) {
    return null;
  }

  try {
    final bytes = base64Decode(base64String);
    final audioFile = FFUploadedFile(
      name: 'audio_file', // you can set the name or get it from other sources
      bytes: bytes,
      height: null,
      width: null,
    );
    return audioFile;
  } catch (e) {
    // handle decoding errors
    return null;
  }
}
