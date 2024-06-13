// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> removeOutdatedRecords(BuildContext context) async {
  final currentTime = DateTime.now().millisecondsSinceEpoch;
  final deleteTimeMs = FFAppState().settime; // 드롭다운에서 설정된 시간(밀리초 단위)
  final recordsToRemove = <RecordlistStruct>[];

  // Recordlist에서 오래된 파일들을 찾습니다.
  FFAppState().Recordlist.forEach((record) {
    final recordDateMs = record.date?.millisecondsSinceEpoch ?? 0;
    if ((currentTime - recordDateMs) >= deleteTimeMs) {
      recordsToRemove.add(record);
    }
  });

  // 오래된 파일들을 Recordlist에서 삭제합니다.
  recordsToRemove.forEach((record) {
    FFAppState().removeFromRecordlist(record);
  });
}
