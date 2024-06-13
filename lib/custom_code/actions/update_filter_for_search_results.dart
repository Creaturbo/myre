// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateFilterForSearchResults(
    BuildContext context, List<String> searchResults) async {
  // 상태 변경을 확인하기 위한 디버깅 로그
  debugPrint('Updating filter field for search results...');

  // FFAppState의 items 리스트를 가져옵니다.
  List<ItemStruct> items = FFAppState().items;

  // 각 검색 결과 항목에 대해 filter 필드를 true로 업데이트합니다.
  for (var searchResult in searchResults) {
    // items 리스트에서 transcription이 searchResult와 일치하는 항목을 찾습니다.
    for (int index = 0; index < items.length; index++) {
      if (items[index].transcription == searchResult) {
        // 새로운 ItemStruct 인스턴스를 만들어 filter 필드를 true로 업데이트합니다.
        ItemStruct updatedItem = ItemStruct(
          meetingSummary: items[index].meetingSummary,
          meetingName: items[index].meetingName,
          audioUrl: items[index].audioUrl,
          notionUrl: items[index].notionUrl,
          topicsCovered: items[index].topicsCovered,
          transcription: items[index].transcription,
          check: items[index].check,
          filter: true, // 필드를 true로 설정
        );
        // 리스트의 해당 항목을 업데이트된 항목으로 교체합니다.
        items[index] = updatedItem;
        // 업데이트 확인을 위한 디버깅 로그
        debugPrint('Updated filter to true for item at index: $index');
      }
    }
  }

  // FFAppState의 items 리스트를 업데이트합니다.
  FFAppState().items = List.from(items);

  // 완료 확인을 위한 디버깅 로그
  debugPrint('Filter field update completed for all search results!');
}
