import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _items = prefs
              .getStringList('ff_items')
              ?.map((x) {
                try {
                  return ItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _items;
    });
    _safeInit(() {
      _Recordlist = prefs
              .getStringList('ff_Recordlist')
              ?.map((x) {
                try {
                  return RecordlistStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Recordlist;
    });
    _safeInit(() {
      _currentURL = prefs.getString('ff_currentURL') ?? _currentURL;
    });
    _safeInit(() {
      _deletetime = prefs.getString('ff_deletetime') ?? _deletetime;
    });
    _safeInit(() {
      _settime = prefs.getInt('ff_settime') ?? _settime;
    });
    _safeInit(() {
      _savesettime = prefs.getInt('ff_savesettime') ?? _savesettime;
    });
    _safeInit(() {
      _savetime = prefs.getString('ff_savetime') ?? _savetime;
    });
    _safeInit(() {
      _isRecording = prefs.getBool('ff_isRecording') ?? _isRecording;
    });
    _safeInit(() {
      _isContinuousRecording =
          prefs.getBool('ff_isContinuousRecording') ?? _isContinuousRecording;
    });
    _safeInit(() {
      _starttime = prefs.getInt('ff_starttime') ?? _starttime;
    });
    _safeInit(() {
      _Recording = prefs.getBool('ff_Recording') ?? _Recording;
    });
    _safeInit(() {
      _loopend = prefs.getBool('ff_loopend') ?? _loopend;
    });
    _safeInit(() {
      _startsignal = prefs.getBool('ff_startsignal') ?? _startsignal;
    });
    _safeInit(() {
      _Signalfactor = prefs.getBool('ff_Signalfactor') ?? _Signalfactor;
    });
    _safeInit(() {
      _favorite = prefs.getBool('ff_favorite') ?? _favorite;
    });
    _safeInit(() {
      _filteritems = prefs
              .getStringList('ff_filteritems')
              ?.map((x) {
                try {
                  return ItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _filteritems;
    });
    _safeInit(() {
      _save = prefs.getBool('ff_save') ?? _save;
    });
    _safeInit(() {
      _aChkList = prefs
              .getStringList('ff_aChkList')
              ?.map((x) {
                try {
                  return RecordlistStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _aChkList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ItemStruct> _items = [];
  List<ItemStruct> get items => _items;
  set items(List<ItemStruct> value) {
    _items = value;
    prefs.setStringList('ff_items', value.map((x) => x.serialize()).toList());
  }

  void addToItems(ItemStruct value) {
    items.add(value);
    prefs.setStringList('ff_items', _items.map((x) => x.serialize()).toList());
  }

  void removeFromItems(ItemStruct value) {
    items.remove(value);
    prefs.setStringList('ff_items', _items.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItems(int index) {
    items.removeAt(index);
    prefs.setStringList('ff_items', _items.map((x) => x.serialize()).toList());
  }

  void updateItemsAtIndex(
    int index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    items[index] = updateFn(_items[index]);
    prefs.setStringList('ff_items', _items.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItems(int index, ItemStruct value) {
    items.insert(index, value);
    prefs.setStringList('ff_items', _items.map((x) => x.serialize()).toList());
  }

  List<RecordlistStruct> _Recordlist = [];
  List<RecordlistStruct> get Recordlist => _Recordlist;
  set Recordlist(List<RecordlistStruct> value) {
    _Recordlist = value;
    prefs.setStringList(
        'ff_Recordlist', value.map((x) => x.serialize()).toList());
  }

  void addToRecordlist(RecordlistStruct value) {
    Recordlist.add(value);
    prefs.setStringList(
        'ff_Recordlist', _Recordlist.map((x) => x.serialize()).toList());
  }

  void removeFromRecordlist(RecordlistStruct value) {
    Recordlist.remove(value);
    prefs.setStringList(
        'ff_Recordlist', _Recordlist.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRecordlist(int index) {
    Recordlist.removeAt(index);
    prefs.setStringList(
        'ff_Recordlist', _Recordlist.map((x) => x.serialize()).toList());
  }

  void updateRecordlistAtIndex(
    int index,
    RecordlistStruct Function(RecordlistStruct) updateFn,
  ) {
    Recordlist[index] = updateFn(_Recordlist[index]);
    prefs.setStringList(
        'ff_Recordlist', _Recordlist.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRecordlist(int index, RecordlistStruct value) {
    Recordlist.insert(index, value);
    prefs.setStringList(
        'ff_Recordlist', _Recordlist.map((x) => x.serialize()).toList());
  }

  String _currentURL = '';
  String get currentURL => _currentURL;
  set currentURL(String value) {
    _currentURL = value;
    prefs.setString('ff_currentURL', value);
  }

  String _deletetime = '1';
  String get deletetime => _deletetime;
  set deletetime(String value) {
    _deletetime = value;
    prefs.setString('ff_deletetime', value);
  }

  int _settime = 3600000;
  int get settime => _settime;
  set settime(int value) {
    _settime = value;
    prefs.setInt('ff_settime', value);
  }

  int _savesettime = 0;
  int get savesettime => _savesettime;
  set savesettime(int value) {
    _savesettime = value;
    prefs.setInt('ff_savesettime', value);
  }

  String _savetime = '60';
  String get savetime => _savetime;
  set savetime(String value) {
    _savetime = value;
    prefs.setString('ff_savetime', value);
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;
    prefs.setBool('ff_isRecording', value);
  }

  bool _isContinuousRecording = false;
  bool get isContinuousRecording => _isContinuousRecording;
  set isContinuousRecording(bool value) {
    _isContinuousRecording = value;
    prefs.setBool('ff_isContinuousRecording', value);
  }

  int _starttime = 0;
  int get starttime => _starttime;
  set starttime(int value) {
    _starttime = value;
    prefs.setInt('ff_starttime', value);
  }

  bool _Recording = false;
  bool get Recording => _Recording;
  set Recording(bool value) {
    _Recording = value;
    prefs.setBool('ff_Recording', value);
  }

  bool _loopend = false;
  bool get loopend => _loopend;
  set loopend(bool value) {
    _loopend = value;
    prefs.setBool('ff_loopend', value);
  }

  bool _startsignal = false;
  bool get startsignal => _startsignal;
  set startsignal(bool value) {
    _startsignal = value;
    prefs.setBool('ff_startsignal', value);
  }

  bool _Signalfactor = true;
  bool get Signalfactor => _Signalfactor;
  set Signalfactor(bool value) {
    _Signalfactor = value;
    prefs.setBool('ff_Signalfactor', value);
  }

  bool _favorite = false;
  bool get favorite => _favorite;
  set favorite(bool value) {
    _favorite = value;
    prefs.setBool('ff_favorite', value);
  }

  List<ItemStruct> _filteritems = [];
  List<ItemStruct> get filteritems => _filteritems;
  set filteritems(List<ItemStruct> value) {
    _filteritems = value;
    prefs.setStringList(
        'ff_filteritems', value.map((x) => x.serialize()).toList());
  }

  void addToFilteritems(ItemStruct value) {
    filteritems.add(value);
    prefs.setStringList(
        'ff_filteritems', _filteritems.map((x) => x.serialize()).toList());
  }

  void removeFromFilteritems(ItemStruct value) {
    filteritems.remove(value);
    prefs.setStringList(
        'ff_filteritems', _filteritems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFilteritems(int index) {
    filteritems.removeAt(index);
    prefs.setStringList(
        'ff_filteritems', _filteritems.map((x) => x.serialize()).toList());
  }

  void updateFilteritemsAtIndex(
    int index,
    ItemStruct Function(ItemStruct) updateFn,
  ) {
    filteritems[index] = updateFn(_filteritems[index]);
    prefs.setStringList(
        'ff_filteritems', _filteritems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFilteritems(int index, ItemStruct value) {
    filteritems.insert(index, value);
    prefs.setStringList(
        'ff_filteritems', _filteritems.map((x) => x.serialize()).toList());
  }

  bool _save = false;
  bool get save => _save;
  set save(bool value) {
    _save = value;
    prefs.setBool('ff_save', value);
  }

  List<RecordlistStruct> _aChkList = [];
  List<RecordlistStruct> get aChkList => _aChkList;
  set aChkList(List<RecordlistStruct> value) {
    _aChkList = value;
    prefs.setStringList(
        'ff_aChkList', value.map((x) => x.serialize()).toList());
  }

  void addToAChkList(RecordlistStruct value) {
    aChkList.add(value);
    prefs.setStringList(
        'ff_aChkList', _aChkList.map((x) => x.serialize()).toList());
  }

  void removeFromAChkList(RecordlistStruct value) {
    aChkList.remove(value);
    prefs.setStringList(
        'ff_aChkList', _aChkList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAChkList(int index) {
    aChkList.removeAt(index);
    prefs.setStringList(
        'ff_aChkList', _aChkList.map((x) => x.serialize()).toList());
  }

  void updateAChkListAtIndex(
    int index,
    RecordlistStruct Function(RecordlistStruct) updateFn,
  ) {
    aChkList[index] = updateFn(_aChkList[index]);
    prefs.setStringList(
        'ff_aChkList', _aChkList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAChkList(int index, RecordlistStruct value) {
    aChkList.insert(index, value);
    prefs.setStringList(
        'ff_aChkList', _aChkList.map((x) => x.serialize()).toList());
  }

  List<RecordtoitemStruct> _recordtoitem = [];
  List<RecordtoitemStruct> get recordtoitem => _recordtoitem;
  set recordtoitem(List<RecordtoitemStruct> value) {
    _recordtoitem = value;
  }

  void addToRecordtoitem(RecordtoitemStruct value) {
    recordtoitem.add(value);
  }

  void removeFromRecordtoitem(RecordtoitemStruct value) {
    recordtoitem.remove(value);
  }

  void removeAtIndexFromRecordtoitem(int index) {
    recordtoitem.removeAt(index);
  }

  void updateRecordtoitemAtIndex(
    int index,
    RecordtoitemStruct Function(RecordtoitemStruct) updateFn,
  ) {
    recordtoitem[index] = updateFn(_recordtoitem[index]);
  }

  void insertAtIndexInRecordtoitem(int index, RecordtoitemStruct value) {
    recordtoitem.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
