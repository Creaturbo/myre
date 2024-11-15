// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> initializeForegroundService() async {
  try {
    // 1. Request necessary permissions
    await requestNecessaryPermissions();

    // 2. Android-specific configuration for background service
    final androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "24/7 365 Recorder",
      notificationText: "Recording in progress",
      notificationImportance: AndroidNotificationImportance.high,
      enableWifiLock: true,
      notificationIcon: AndroidResource(
        name: 'ic_foreground_icon',
        defType: 'mipmap',
      ),
    );

    // 3. Initialize the FlutterBackground plugin
    final initialized =
        await FlutterBackground.initialize(androidConfig: androidConfig);
    if (initialized) {
      print('Foreground service initialized successfully.');
      await FlutterBackground.enableBackgroundExecution();
      print('Foreground service started successfully.');

      // 4. Show recording indicator in the UI
      showRecordingIndicator();
    } else {
      print('Failed to initialize the foreground service.');
    }
  } catch (e) {
    print('Error initializing foreground service: $e');
  }
}

Future<void> enableBackgroundExecution() async {
  try {
    // Ensure the foreground service is initialized
    final isInitialized = await FlutterBackground.isBackgroundExecutionEnabled;
    if (!isInitialized) {
      print("Foreground service not initialized. Initializing...");
      await initializeForegroundService();
    } else {
      print("Foreground service already running.");
    }
  } catch (e) {
    print('Error enabling background execution: $e');
  }
}

Future<void> requestNecessaryPermissions() async {
  // Request permissions
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  if (await Permission.ignoreBatteryOptimizations.isDenied) {
    await Permission.ignoreBatteryOptimizations.request();
  }
  print("Necessary permissions have been requested.");
}

void showRecordingIndicator() {
  // Add UI code to display a recording indicator in the app's foreground
  // This could be a notification, status bar icon, or a custom UI element
  print("Displaying recording indicator in the UI");
}
