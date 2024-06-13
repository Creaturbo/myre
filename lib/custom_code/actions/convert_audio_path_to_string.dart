// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io'; // for file operations

Future<String?> convertAudioPathToString(String? audioPath) async {
  if (audioPath == null || audioPath.isEmpty) {
    return null;
  }

  try {
    return audioPath;
  } catch (e) {
    // error handling
    return null;
  }
}
