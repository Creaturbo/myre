// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_background/flutter_background.dart';

Future<void> enableBackgroundExecution() async {
  bool success = await FlutterBackground.enableBackgroundExecution();
  if (success) {
    print('Background execution enabled successfully');
  } else {
    print('Failed to enable background execution');
  }
}
