// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// 불필요한 import 문 제거
// import '/backend/schema/structs/index.dart';
// import '/actions/actions.dart' as action_blocks;

Future<int?> convertMinutesToMilliseconds(String? numericString) async {
  if (numericString == null || numericString.isEmpty) {
    return null;
  }

  try {
    final int minutes = int.tryParse(numericString) ?? 0;
    final int milliseconds = minutes * 60 * 1000; // 분 -> 초 -> 밀리초로 변환
    return milliseconds;
  } catch (e) {
    // 변환 중 발생할 수 있는 오류 처리
    return null;
  }
}
