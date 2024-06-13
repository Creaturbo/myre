// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> waitForStartSignal(BuildContext context) async {
  // Debugging logs to check state changes
  debugPrint('Waiting for startsignal to be true...');

  // startSignal이 true가 될 때까지 기다립니다.
  while (!FFAppState().startsignal) {
    await Future.delayed(
        const Duration(milliseconds: 100)); // 100ms 간격으로 상태를 체크합니다.
  }

  // Debugging logs to confirm state change
  debugPrint('Startsignal is now true!');
}
