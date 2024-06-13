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
import 'dart:io'; // for reading files

Future<FFUploadedFile?> convertStringToUploadedFile(String audioPath) async {
  if (audioPath.isEmpty) {
    return null;
  }

  try {
    // 파일 읽기
    final file = File(audioPath);
    final bytes = await file.readAsBytes();

    // FFUploadedFile로 변환
    final audioFile = FFUploadedFile(
      name: 'audio_file', // 파일 이름 설정
      bytes: bytes,
      height: null,
      width: null,
    );
    return audioFile;
  } catch (e) {
    // 오류 처리
    return null;
  }
}
