// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:realvoicetest2/app_state.dart';

Future<void> startRecordingWithTimer(BuildContext context) async {
  final startTime = DateTime.now().millisecondsSinceEpoch;
  FFAppState().starttime = startTime;
  final saveSetTime = FFAppState().savesettime;
  FFAppState().Recording = true;

  print(
      'Recording started: startTime = $startTime, saveSetTime = $saveSetTime');

  if (startTime == null || startTime == 0) {
    print('Error: startTime is not set.');
    return;
  }

  if (saveSetTime == null || saveSetTime <= 0) {
    print('Error: saveSetTime is not set.');
    return;
  }

  Timer(Duration(milliseconds: saveSetTime), () async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final elapsedTime = currentTime - startTime;

    print(
        'Timer fired: currentTime = $currentTime, elapsedTime = $elapsedTime');

    if (elapsedTime >= saveSetTime && FFAppState().Recording) {
      print('Stopping recording...');
      await stopRecordingChain(context);
    }
  });
}

Future<void> stopRecordingChain(BuildContext context) async {
  print('stopRecordingChain called');
  await stopAudioRecording(context);
  await updatePageState(context);
  await updateAppState(context);
  await customAction(context);
  await navigateToTabBar(context);
}

Future<void> stopAudioRecording(BuildContext context) async {
  FFAppState().Recording = false;
  FFAppState().starttime = 0;
  print('Recording stopped.');
}

Future<void> updatePageState(BuildContext context) async {
  print('Page state updated.');
}

Future<void> updateAppState(BuildContext context) async {
  print('App state updated.');
}

Future<void> customAction(BuildContext context) async {
  print('Custom action executed.');
}

Future<void> navigateToTabBar(BuildContext context) async {
  print('Navigated to tab bar.');
}
