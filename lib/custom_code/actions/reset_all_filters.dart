// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> resetAllFilters(BuildContext context) async {
  // 상태 변경을 확인하기 위한 디버깅 로그
  debugPrint('Resetting all filter fields to false...');

  // FFAppState의 items 리스트를 가져옵니다.
  List<ItemStruct> items = FFAppState().items;

  // 모든 항목의 filter 필드를 false로 업데이트합니다.
  for (int index = 0; index < items.length; index++) {
    // 새로운 ItemStruct 인스턴스를 만들어 filter 필드를 false로 업데이트합니다.
    ItemStruct updatedItem = ItemStruct(
      meetingSummary: items[index].meetingSummary,
      meetingName: items[index].meetingName,
      audioUrl: items[index].audioUrl,
      notionUrl: items[index].notionUrl,
      topicsCovered: items[index].topicsCovered,
      transcription: items[index].transcription,
      check: items[index].check,
      filter: false, // 필드를 false로 설정
    );
    // 리스트의 해당 항목을 업데이트된 항목으로 교체합니다.
    items[index] = updatedItem;
    // 업데이트 확인을 위한 디버깅 로그
    debugPrint('Reset filter to false for item at index: $index');
  }

  // FFAppState의 items 리스트를 업데이트합니다.
  FFAppState().items = List.from(items);

  // 완료 확인을 위한 디버깅 로그
  debugPrint('All filter fields reset to false!');
}
