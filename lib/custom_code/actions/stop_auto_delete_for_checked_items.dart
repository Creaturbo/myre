// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async'; // Timer를 사용하기 위해 추가

Future<void> stopAutoDeleteForCheckedItems(BuildContext context) async {
  // save 값이 true인 항목을 확인하고, 자동 삭제를 멈추도록 설정
  final recordsToKeep = <RecordlistStruct>[];

  // Recordlist에서 save 값이 true인 항목들을 필터링
  FFAppState().Recordlist.forEach((recordItem) {
    if (recordItem.save == true) {
      recordsToKeep.add(recordItem);
    }
  });

  // save 값이 true인 항목들을 자동 삭제에서 제외하기 위해, 임시로 리스트에서 제거했다가 다시 추가
  recordsToKeep.forEach((record) {
    FFAppState().removeFromRecordlist(record);
    FFAppState().addToRecordlist(record);
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
