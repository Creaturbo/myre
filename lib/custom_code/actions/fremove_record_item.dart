// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> fremoveRecordItem(BuildContext context) async {
  // check 값이 True인 항목 필터링 및 내용 삭제
  List<RecordlistStruct> updatedRecordlist =
      FFAppState().Recordlist.map<RecordlistStruct>((recordItem) {
    if (recordItem.fcheck == true) {
      return RecordlistStruct(
          audiofile: '', // Audio Path 비우기
          date: DateTime(1970, 1, 1), // DateTime 기본값 설정
          fcheck: false // Boolean 초기화
          );
    } else {
      return recordItem;
    }
  }).toList();

  FFAppState().Recordlist = updatedRecordlist;
}
