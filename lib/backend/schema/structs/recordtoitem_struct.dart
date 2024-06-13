// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordtoitemStruct extends BaseStruct {
  RecordtoitemStruct({
    DateTime? date,
  }) : _date = date;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static RecordtoitemStruct fromMap(Map<String, dynamic> data) =>
      RecordtoitemStruct(
        date: data['date'] as DateTime?,
      );

  static RecordtoitemStruct? maybeFromMap(dynamic data) => data is Map
      ? RecordtoitemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RecordtoitemStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecordtoitemStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RecordtoitemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecordtoitemStruct && date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([date]);
}

RecordtoitemStruct createRecordtoitemStruct({
  DateTime? date,
}) =>
    RecordtoitemStruct(
      date: date,
    );
