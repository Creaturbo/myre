// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // base64 인코딩을 위해 필요

Future<String> convertToBase64(FFUploadedFile? audioFile) async {
  if (audioFile == null || audioFile.bytes == null) {
    return '';
  }

  try {
    final base64String = base64Encode(audioFile.bytes!);
    return base64String;
  } catch (e) {
    // 인코딩 중 발생할 수 있는 오류 처리
    return '';
  }
}
