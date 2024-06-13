// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io'; // for file handling
import 'dart:typed_data'; // for handling byte data

Future<FFUploadedFile?> pathToFile(String audioPath) async {
  if (audioPath.isEmpty) {
    return FFUploadedFile(
      name: 'Error',
      bytes: Uint8List(0),
      height: null,
      width: null,
    );
  }

  try {
    final file = File(audioPath);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      final audioFile = FFUploadedFile(
        name: file.path.split('/').last,
        bytes: bytes,
        height: null,
        width: null,
      );
      return audioFile;
    } else {
      print('File does not exist');
      return FFUploadedFile(
        name: 'File does not exist',
        bytes: Uint8List(0),
        height: null,
        width: null,
      );
    }
  } catch (e) {
    print('Error reading file: $e');
    return FFUploadedFile(
      name: 'Error',
      bytes: Uint8List(0),
      height: null,
      width: null,
    );
  }
}
