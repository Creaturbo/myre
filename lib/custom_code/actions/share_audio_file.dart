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
import 'package:share_plus/share_plus.dart'; // import share_plus package

Future<void> shareAudioFile(String? audioPath) async {
  if (audioPath == null || audioPath.isEmpty) {
    print('Audio path is null or empty');
    return;
  }

  try {
    final file = File(audioPath);
    if (await file.exists()) {
      // Share the audio file
      final result = await Share.shareXFiles([XFile(audioPath)],
          text: 'Check out this audio file!');

      if (result.status == ShareResultStatus.success) {
        print('Thank you for sharing the audio file!');
      } else if (result.status == ShareResultStatus.dismissed) {
        print('Did you not like the audio file?');
      }
    } else {
      print('File does not exist');
    }
  } catch (e) {
    print('Error reading or sharing file: $e');
  }
}
