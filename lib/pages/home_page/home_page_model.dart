import '/backend/api_requests/api_calls.dart';
import '/components/transcribe_item_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool? recording = false;

  bool? responseReceived = false;

  bool? responseSent = false;

  DateTime? startTime;

  DateTime? endTime;

  String? file;

  List<FFUploadedFile> audiofilebyte = [];
  void addToAudiofilebyte(FFUploadedFile item) => audiofilebyte.add(item);
  void removeFromAudiofilebyte(FFUploadedFile item) =>
      audiofilebyte.remove(item);
  void removeAtIndexFromAudiofilebyte(int index) =>
      audiofilebyte.removeAt(index);
  void insertAtIndexInAudiofilebyte(int index, FFUploadedFile item) =>
      audiofilebyte.insert(index, item);
  void updateAudiofilebyteAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      audiofilebyte[index] = updateFn(audiofilebyte[index]);

  bool isShowFullList = true;

  bool? recording1;

  int? idx;

  bool chkAll = false;

  String checkAll = 'Check All';

  String uncheckAll = 'Uncheck All';

  int? fidx;

  bool fchkAll = false;

  String fcheckAll = 'fCheck All';

  String funcheckAll = 'fUncheck All';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  String? audioRecord;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  AudioRecorder? audioRecorder;
  // State field(s) for Timer widget.
  final timerInitialTimeMs1 = 0;
  int timerMilliseconds1 = 0;
  String timerValue1 = StopWatchTimer.getDisplayTime(0);
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  String? audioRecord1;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // State field(s) for Timer widget.
  final timerInitialTimeMs2 = 0;
  int timerMilliseconds2 = 0;
  String timerValue2 = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // Stores action output result for [Custom Action - pathToFile] action in Icon widget.
  FFUploadedFile? recordedfile1;
  // Stores action output result for [Backend Call - API (Transcribe Meeting)] action in Icon widget.
  ApiCallResponse? apiRequestBuildship;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Stores action output result for [Custom Action - pathToFile] action in Icon widget.
  FFUploadedFile? recordedfile;
  // Stores action output result for [Backend Call - API (Transcribe Meeting)] action in Icon widget.
  ApiCallResponse? apiRequestBuildship1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];
  // Model for TranscribeItem component.
  late TranscribeItemModel transcribeItemModel1;
  // Model for TranscribeItem component.
  late TranscribeItemModel transcribeItemModel3;
  // Stores action output result for [Custom Action - pathToFile] action in Icon widget.
  FFUploadedFile? recordedfile3;
  // Stores action output result for [Backend Call - API (Transcribe Meeting)] action in Icon widget.
  ApiCallResponse? apiRequestBuildship2;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    transcribeItemModel1 = createModel(context, () => TranscribeItemModel());
    transcribeItemModel3 = createModel(context, () => TranscribeItemModel());
  }

  @override
  void dispose() {
    tabBarController1?.dispose();
    timerController1.dispose();
    timerController2.dispose();
    tabBarController2?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    transcribeItemModel1.dispose();
    transcribeItemModel3.dispose();
  }
}
