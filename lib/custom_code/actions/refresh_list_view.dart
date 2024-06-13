// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> refreshListView(BuildContext context) async {
  // context가 Element 타입인지 확인 후 reassemble 호출
  if (context is Element) {
    context.reassemble();
  } else {
    // context가 Element 타입이 아닐 경우, 적절한 예외 처리나 로그 추가
    debugPrint('The context is not an Element.');
  }
}
