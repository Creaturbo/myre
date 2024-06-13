// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemStruct extends BaseStruct {
  ItemStruct({
    String? meetingSummary,
    String? meetingName,
    String? audioUrl,
    String? notionUrl,
    String? topicsCovered,
    String? transcription,
    bool? check,
    bool? filter,
    bool? timedelete,
    DateTime? date,
  })  : _meetingSummary = meetingSummary,
        _meetingName = meetingName,
        _audioUrl = audioUrl,
        _notionUrl = notionUrl,
        _topicsCovered = topicsCovered,
        _transcription = transcription,
        _check = check,
        _filter = filter,
        _timedelete = timedelete,
        _date = date;

  // "meetingSummary" field.
  String? _meetingSummary;
  String get meetingSummary => _meetingSummary ?? '';
  set meetingSummary(String? val) => _meetingSummary = val;

  bool hasMeetingSummary() => _meetingSummary != null;

  // "meetingName" field.
  String? _meetingName;
  String get meetingName => _meetingName ?? '';
  set meetingName(String? val) => _meetingName = val;

  bool hasMeetingName() => _meetingName != null;

  // "audioUrl" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "notionUrl" field.
  String? _notionUrl;
  String get notionUrl => _notionUrl ?? '';
  set notionUrl(String? val) => _notionUrl = val;

  bool hasNotionUrl() => _notionUrl != null;

  // "topicsCovered" field.
  String? _topicsCovered;
  String get topicsCovered => _topicsCovered ?? '';
  set topicsCovered(String? val) => _topicsCovered = val;

  bool hasTopicsCovered() => _topicsCovered != null;

  // "transcription" field.
  String? _transcription;
  String get transcription => _transcription ?? '';
  set transcription(String? val) => _transcription = val;

  bool hasTranscription() => _transcription != null;

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  set check(bool? val) => _check = val;

  bool hasCheck() => _check != null;

  // "filter" field.
  bool? _filter;
  bool get filter => _filter ?? false;
  set filter(bool? val) => _filter = val;

  bool hasFilter() => _filter != null;

  // "timedelete" field.
  bool? _timedelete;
  bool get timedelete => _timedelete ?? false;
  set timedelete(bool? val) => _timedelete = val;

  bool hasTimedelete() => _timedelete != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static ItemStruct fromMap(Map<String, dynamic> data) => ItemStruct(
        meetingSummary: data['meetingSummary'] as String?,
        meetingName: data['meetingName'] as String?,
        audioUrl: data['audioUrl'] as String?,
        notionUrl: data['notionUrl'] as String?,
        topicsCovered: data['topicsCovered'] as String?,
        transcription: data['transcription'] as String?,
        check: data['check'] as bool?,
        filter: data['filter'] as bool?,
        timedelete: data['timedelete'] as bool?,
        date: data['date'] as DateTime?,
      );

  static ItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'meetingSummary': _meetingSummary,
        'meetingName': _meetingName,
        'audioUrl': _audioUrl,
        'notionUrl': _notionUrl,
        'topicsCovered': _topicsCovered,
        'transcription': _transcription,
        'check': _check,
        'filter': _filter,
        'timedelete': _timedelete,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'meetingSummary': serializeParam(
          _meetingSummary,
          ParamType.String,
        ),
        'meetingName': serializeParam(
          _meetingName,
          ParamType.String,
        ),
        'audioUrl': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'notionUrl': serializeParam(
          _notionUrl,
          ParamType.String,
        ),
        'topicsCovered': serializeParam(
          _topicsCovered,
          ParamType.String,
        ),
        'transcription': serializeParam(
          _transcription,
          ParamType.String,
        ),
        'check': serializeParam(
          _check,
          ParamType.bool,
        ),
        'filter': serializeParam(
          _filter,
          ParamType.bool,
        ),
        'timedelete': serializeParam(
          _timedelete,
          ParamType.bool,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemStruct(
        meetingSummary: deserializeParam(
          data['meetingSummary'],
          ParamType.String,
          false,
        ),
        meetingName: deserializeParam(
          data['meetingName'],
          ParamType.String,
          false,
        ),
        audioUrl: deserializeParam(
          data['audioUrl'],
          ParamType.String,
          false,
        ),
        notionUrl: deserializeParam(
          data['notionUrl'],
          ParamType.String,
          false,
        ),
        topicsCovered: deserializeParam(
          data['topicsCovered'],
          ParamType.String,
          false,
        ),
        transcription: deserializeParam(
          data['transcription'],
          ParamType.String,
          false,
        ),
        check: deserializeParam(
          data['check'],
          ParamType.bool,
          false,
        ),
        filter: deserializeParam(
          data['filter'],
          ParamType.bool,
          false,
        ),
        timedelete: deserializeParam(
          data['timedelete'],
          ParamType.bool,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemStruct &&
        meetingSummary == other.meetingSummary &&
        meetingName == other.meetingName &&
        audioUrl == other.audioUrl &&
        notionUrl == other.notionUrl &&
        topicsCovered == other.topicsCovered &&
        transcription == other.transcription &&
        check == other.check &&
        filter == other.filter &&
        timedelete == other.timedelete &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([
        meetingSummary,
        meetingName,
        audioUrl,
        notionUrl,
        topicsCovered,
        transcription,
        check,
        filter,
        timedelete,
        date
      ]);
}

ItemStruct createItemStruct({
  String? meetingSummary,
  String? meetingName,
  String? audioUrl,
  String? notionUrl,
  String? topicsCovered,
  String? transcription,
  bool? check,
  bool? filter,
  bool? timedelete,
  DateTime? date,
}) =>
    ItemStruct(
      meetingSummary: meetingSummary,
      meetingName: meetingName,
      audioUrl: audioUrl,
      notionUrl: notionUrl,
      topicsCovered: topicsCovered,
      transcription: transcription,
      check: check,
      filter: filter,
      timedelete: timedelete,
      date: date,
    );
