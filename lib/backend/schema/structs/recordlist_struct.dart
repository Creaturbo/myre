// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecordlistStruct extends BaseStruct {
  RecordlistStruct({
    String? audiofile,
    DateTime? date,
    bool? check,
    bool? favorite,
    String? name,
    bool? save,
    int? id,
    bool? nameedit,
    String? wave,
  })  : _audiofile = audiofile,
        _date = date,
        _check = check,
        _favorite = favorite,
        _name = name,
        _save = save,
        _id = id,
        _nameedit = nameedit,
        _wave = wave;

  // "audiofile" field.
  String? _audiofile;
  String get audiofile => _audiofile ?? '';
  set audiofile(String? val) => _audiofile = val;

  bool hasAudiofile() => _audiofile != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "check" field.
  bool? _check;
  bool get check => _check ?? false;
  set check(bool? val) => _check = val;

  bool hasCheck() => _check != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  set favorite(bool? val) => _favorite = val;

  bool hasFavorite() => _favorite != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "save" field.
  bool? _save;
  bool get save => _save ?? false;
  set save(bool? val) => _save = val;

  bool hasSave() => _save != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nameedit" field.
  bool? _nameedit;
  bool get nameedit => _nameedit ?? false;
  set nameedit(bool? val) => _nameedit = val;

  bool hasNameedit() => _nameedit != null;

  // "wave" field.
  String? _wave;
  String get wave => _wave ?? '';
  set wave(String? val) => _wave = val;

  bool hasWave() => _wave != null;

  static RecordlistStruct fromMap(Map<String, dynamic> data) =>
      RecordlistStruct(
        audiofile: data['audiofile'] as String?,
        date: data['date'] as DateTime?,
        check: data['check'] as bool?,
        favorite: data['favorite'] as bool?,
        name: data['name'] as String?,
        save: data['save'] as bool?,
        id: castToType<int>(data['id']),
        nameedit: data['nameedit'] as bool?,
        wave: data['wave'] as String?,
      );

  static RecordlistStruct? maybeFromMap(dynamic data) => data is Map
      ? RecordlistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'audiofile': _audiofile,
        'date': _date,
        'check': _check,
        'favorite': _favorite,
        'name': _name,
        'save': _save,
        'id': _id,
        'nameedit': _nameedit,
        'wave': _wave,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'audiofile': serializeParam(
          _audiofile,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'check': serializeParam(
          _check,
          ParamType.bool,
        ),
        'favorite': serializeParam(
          _favorite,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'save': serializeParam(
          _save,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nameedit': serializeParam(
          _nameedit,
          ParamType.bool,
        ),
        'wave': serializeParam(
          _wave,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecordlistStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecordlistStruct(
        audiofile: deserializeParam(
          data['audiofile'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        check: deserializeParam(
          data['check'],
          ParamType.bool,
          false,
        ),
        favorite: deserializeParam(
          data['favorite'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        save: deserializeParam(
          data['save'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nameedit: deserializeParam(
          data['nameedit'],
          ParamType.bool,
          false,
        ),
        wave: deserializeParam(
          data['wave'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecordlistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecordlistStruct &&
        audiofile == other.audiofile &&
        date == other.date &&
        check == other.check &&
        favorite == other.favorite &&
        name == other.name &&
        save == other.save &&
        id == other.id &&
        nameedit == other.nameedit &&
        wave == other.wave;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([audiofile, date, check, favorite, name, save, id, nameedit, wave]);
}

RecordlistStruct createRecordlistStruct({
  String? audiofile,
  DateTime? date,
  bool? check,
  bool? favorite,
  String? name,
  bool? save,
  int? id,
  bool? nameedit,
  String? wave,
}) =>
    RecordlistStruct(
      audiofile: audiofile,
      date: date,
      check: check,
      favorite: favorite,
      name: name,
      save: save,
      id: id,
      nameedit: nameedit,
      wave: wave,
    );
