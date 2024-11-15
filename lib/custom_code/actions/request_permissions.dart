// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.ignoreBatteryOptimizations,
    Permission.requestInstallPackages, // 예시로 다른 권한 사용
    Permission.systemAlertWindow, // WAKE_LOCK 권한 대체
  ].request();

  statuses.forEach((permission, status) {
    if (status.isDenied) {
      print('${permission.toString()} 권한이 거부되었습니다.');
    } else {
      print('${permission.toString()} 권한이 허가되었습니다.');
    }
  });
}
