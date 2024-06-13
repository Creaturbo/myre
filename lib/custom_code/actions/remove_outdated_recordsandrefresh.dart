// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '/flutter_flow/custom_functions.dart'; // Imports custom functions

Future<void> removeOutdatedRecordsandrefresh(BuildContext context) async {
  final currentTime = DateTime.now().millisecondsSinceEpoch;
  final deleteTimeMs = FFAppState().settime; // 드롭다운에서 설정된 시간(밀리초 단위)
  final recordsToRemove = <RecordlistStruct>[];

  // Recordlist에서 오래된 파일들을 찾습니다.
  FFAppState().Recordlist.forEach((record) {
    final recordDateMs = record.date?.millisecondsSinceEpoch ?? 0;
    if (!record.save && (currentTime - recordDateMs) >= deleteTimeMs) {
      recordsToRemove.add(record);
    }
  });

  // 오래된 파일들을 Recordlist에서 삭제합니다.
  recordsToRemove.forEach((record) {
    FFAppState().removeFromRecordlist(record);
  });

  // 리스트뷰를 리프레쉬합니다.
  await refreshListView(context);
}

// 추가된 리프레쉬 함수
Future<void> refreshListView(BuildContext context) async {
  // context가 Element 타입인지 확인 후 reassemble 호출
  if (context is Element) {
    context.reassemble();
  } else {
    // context가 Element 타입이 아닐 경우, 적절한 예외 처리나 로그 추가
    debugPrint('The context is not an Element.');
  }
}
