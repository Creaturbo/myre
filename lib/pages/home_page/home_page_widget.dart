import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_component_widget.dart';
import '/components/how_to_use_widget.dart';
import '/components/meeting_details_widget.dart';
import '/components/name_widget.dart';
import '/components/note_widget.dart';
import '/components/option_widget.dart';
import '/components/transcribe_item_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:text_search/text_search.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: const HowToUseWidget(),
            ),
          );
        },
      );
    });

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.tabBarController2 = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.isShowFullList = true;
        safeSetState(() {});
        await actions.resetAllFilters(
          context,
        );
        await actions.updateFilterForSearchResults(
          context,
          _model.simpleSearchResults.toList(),
        );
        await actions.refreshListView(
          context,
        );
      },
    );
    animationsMap.addAll({
      'transcribeItemOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transcribeItemOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'wu2rs2xg' /* 24/7 365 Recorder */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Urbanist',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [
              Align(
                alignment: const AlignmentDirectional(10.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const OptionWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        Stack(
                          children: [
                            Stack(
                              children: [
                                Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: const Alignment(0.0, 0),
                                            child: TabBar(
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              unselectedLabelStyle: const TextStyle(),
                                              indicatorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              padding: const EdgeInsets.all(4.0),
                                              tabs: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .microphone,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    const Tab(
                                                      text: '',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .format_list_bulleted,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    const Tab(
                                                      text: '',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.text_fields,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    const Tab(
                                                      text: '',
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                    const Tab(
                                                      text: '',
                                                    ),
                                                  ],
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController1,
                                              onTap: (i) async {
                                                [
                                                  () async {},
                                                  () async {},
                                                  () async {},
                                                  () async {}
                                                ][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController1,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 3,
                                                          child: Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              if (_model
                                                                      .recording ??
                                                                  true)
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await stopAudioRecording(
                                                                        audioRecorder:
                                                                            _model.audioRecorder,
                                                                        audioName:
                                                                            'recordedFileBytes1.mp3',
                                                                        onRecordingComplete:
                                                                            (audioFilePath,
                                                                                audioBytes) {
                                                                          _model.audioRecord =
                                                                              audioFilePath;
                                                                          _model.recordedFileBytes1 =
                                                                              audioBytes;
                                                                        },
                                                                      );

                                                                      _model.recording =
                                                                          false;
                                                                      _model.endTime =
                                                                          getCurrentTimestamp;
                                                                      _model.file =
                                                                          _model
                                                                              .audioRecord;
                                                                      _model.responseSent =
                                                                          true;
                                                                      _model.addToAudiofilebyte(
                                                                          _model
                                                                              .recordedFileBytes1);
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                          .addToRecordlist(
                                                                              RecordlistStruct(
                                                                        audiofile:
                                                                            _model.audioRecord,
                                                                        date: _model
                                                                            .endTime,
                                                                        check:
                                                                            false,
                                                                        name:
                                                                            'Untitled${FFAppState().Recordlist.length.toString()}',
                                                                      ));
                                                                      FFAppState()
                                                                              .Recording =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      await actions
                                                                          .removeOutdatedRecordsandrefresh(
                                                                        context,
                                                                      );
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          _model
                                                                              .timerController1
                                                                              .timer
                                                                              .setPresetTime(
                                                                            mSec:
                                                                                FFAppState().savesettime,
                                                                            add:
                                                                                false,
                                                                          );
                                                                          _model
                                                                              .timerController1
                                                                              .onResetTimer();

                                                                          safeSetState(
                                                                              () {
                                                                            _model.tabBarController1!.animateTo(
                                                                              min(_model.tabBarController1!.length - 1, _model.tabBarController1!.index + 1),
                                                                              duration: const Duration(milliseconds: 300),
                                                                              curve: Curves.ease,
                                                                            );
                                                                          });

                                                                          if (FFAppState().Signalfactor ==
                                                                              true) {
                                                                            FFAppState().startsignal =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            FFAppState().startsignal =
                                                                                false;
                                                                            safeSetState(() {});
                                                                          }
                                                                        }),
                                                                        Future(
                                                                            () async {
                                                                          _model
                                                                              .timerController2
                                                                              .onResetTimer();
                                                                        }),
                                                                      ]);

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        child: custom_widgets
                                                                            .RecordingRipple(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          repeat:
                                                                              true,
                                                                          rippleColor:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          elevation:
                                                                              4.0,
                                                                          borderRadius:
                                                                              100.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          borderWidth:
                                                                              5.0,
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          iconSize:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!_model
                                                                  .recording!)
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                              .startsignal =
                                                                          true;
                                                                      FFAppState()
                                                                              .loopend =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await actions
                                                                          .enableBackgroundExecution();
                                                                      while (FFAppState()
                                                                          .loopend) {
                                                                        await startAudioRecording(
                                                                          context,
                                                                          audioRecorder: _model.audioRecorder ??=
                                                                              AudioRecorder(),
                                                                        );

                                                                        await Future
                                                                            .wait([
                                                                          Future(
                                                                              () async {
                                                                            _model.timerController1.onStartTimer();
                                                                            _model.recording =
                                                                                true;
                                                                            _model.startTime =
                                                                                getCurrentTimestamp;
                                                                            _model.responseReceived =
                                                                                false;
                                                                            _model.responseSent =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            FFAppState().starttime =
                                                                                _model.endTime!.millisecondsSinceEpoch;
                                                                            FFAppState().Recording =
                                                                                true;
                                                                            FFAppState().startsignal =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            await actions.waitForStartSignal(
                                                                              context,
                                                                            );
                                                                          }),
                                                                          Future(
                                                                              () async {
                                                                            _model.timerController2.onStartTimer();
                                                                          }),
                                                                        ]);
                                                                      }
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          4.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                5.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .mic,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.03,
                                                                        0.95),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.48),
                                                                      child:
                                                                          FlutterFlowTimer(
                                                                        initialTime:
                                                                            FFAppState().savesettime,
                                                                        getDisplayTime:
                                                                            (value) =>
                                                                                StopWatchTimer.getDisplayTime(value),
                                                                        controller:
                                                                            _model.timerController1,
                                                                        updateStateInterval:
                                                                            const Duration(milliseconds: 1000),
                                                                        onChanged: (value,
                                                                            displayTime,
                                                                            shouldUpdate) {
                                                                          _model.timerMilliseconds1 =
                                                                              value;
                                                                          _model.timerValue1 =
                                                                              displayTime;
                                                                          if (shouldUpdate) {
                                                                            safeSetState(() {});
                                                                          }
                                                                        },
                                                                        onEnded:
                                                                            () async {
                                                                          await stopAudioRecording(
                                                                            audioRecorder:
                                                                                _model.audioRecorder,
                                                                            audioName:
                                                                                'recordedFileBytes2.mp3',
                                                                            onRecordingComplete:
                                                                                (audioFilePath, audioBytes) {
                                                                              _model.audioRecord1 = audioFilePath;
                                                                              _model.recordedFileBytes2 = audioBytes;
                                                                            },
                                                                          );

                                                                          _model.recording =
                                                                              false;
                                                                          _model.endTime =
                                                                              getCurrentTimestamp;
                                                                          _model.file =
                                                                              _model.audioRecord1;
                                                                          _model.responseSent =
                                                                              true;
                                                                          _model
                                                                              .addToAudiofilebyte(_model.recordedFileBytes1);
                                                                          safeSetState(
                                                                              () {});
                                                                          FFAppState()
                                                                              .addToRecordlist(RecordlistStruct(
                                                                            audiofile:
                                                                                _model.audioRecord1,
                                                                            date:
                                                                                _model.endTime,
                                                                            check:
                                                                                false,
                                                                          ));
                                                                          FFAppState().Recording =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                          await actions
                                                                              .removeOutdatedRecordsandrefresh(
                                                                            context,
                                                                          );
                                                                          await Future
                                                                              .wait([
                                                                            Future(() async {
                                                                              _model.timerController1.timer.setPresetTime(
                                                                                mSec: FFAppState().savesettime,
                                                                                add: false,
                                                                              );
                                                                              _model.timerController1.onResetTimer();

                                                                              if (FFAppState().Signalfactor == true) {
                                                                                FFAppState().startsignal = true;
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                FFAppState().startsignal = false;
                                                                                safeSetState(() {});
                                                                              }
                                                                            }),
                                                                            Future(() async {
                                                                              _model.timerController2.onResetTimer();
                                                                            }),
                                                                          ]);

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: 'Urbanist',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.46),
                                                                child:
                                                                    FlutterFlowTimer(
                                                                  initialTime:
                                                                      _model
                                                                          .timerInitialTimeMs2,
                                                                  getDisplayTime: (value) =>
                                                                      StopWatchTimer.getDisplayTime(
                                                                          value,
                                                                          milliSecond:
                                                                              false),
                                                                  controller: _model
                                                                      .timerController2,
                                                                  updateStateInterval:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                  onChanged: (value,
                                                                      displayTime,
                                                                      shouldUpdate) {
                                                                    _model.timerMilliseconds2 =
                                                                        value;
                                                                    _model.timerValue2 =
                                                                        displayTime;
                                                                    if (shouldUpdate) {
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            30.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 24.0)),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    const Alignment(
                                                                        0.0, 0),
                                                                child:
                                                                    FlutterFlowButtonTabBar(
                                                                  useToggleButtonStyle:
                                                                      true,
                                                                  isScrollable:
                                                                      true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  unselectedLabelStyle:
                                                                      const TextStyle(),
                                                                  labelColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  unselectedLabelColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  unselectedBackgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      12.0,
                                                                  elevation:
                                                                      0.0,
                                                                  labelPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                                  tabs: [
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'cxfeoqs0' /* Month */,
                                                                      ),
                                                                    ),
                                                                    Tab(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'sdmrl5mj' /* Week */,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  controller: _model
                                                                      .tabBarController2,
                                                                  onTap:
                                                                      (i) async {
                                                                    [
                                                                      () async {},
                                                                      () async {
                                                                        await actions
                                                                            .refreshListView(
                                                                          context,
                                                                        );
                                                                      }
                                                                    ][i]();
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    TabBarView(
                                                                  controller: _model
                                                                      .tabBarController2,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      1.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: FlutterFlowCalendar(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                weekFormat: false,
                                                                                weekStartsMonday: true,
                                                                                onChange: (DateTimeRange? newSelectedDate) async {
                                                                                  if (_model.calendarSelectedDay1 == newSelectedDate) {
                                                                                    return;
                                                                                  }
                                                                                  _model.calendarSelectedDay1 = newSelectedDate;
                                                                                  await actions.refreshListView(
                                                                                    context,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                },
                                                                                titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                dayOfWeekStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: const [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              2.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'gm2ys2l7' /* Recording list */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.idx = 0;
                                                                                              safeSetState(() {});
                                                                                              while (_model.idx! < FFAppState().Recordlist.length) {
                                                                                                FFAppState().updateRecordlistAtIndex(
                                                                                                  _model.idx!,
                                                                                                  (e) => e..check = _model.chkAll ? false : true,
                                                                                                );
                                                                                                FFAppState().update(() {});
                                                                                                _model.idx = _model.idx! + 1;
                                                                                                safeSetState(() {});
                                                                                              }
                                                                                              _model.chkAll = !_model.chkAll;
                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: '',
                                                                                            icon: Icon(
                                                                                              Icons.checklist_sharp,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 27.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: 50.0,
                                                                                              height: 40.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(24.0),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: const Text('Delete?'),
                                                                                                            content: const Text('Do you want to delete this item?'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                child: const Text('Cancel'),
                                                                                                              ),
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                child: const Text('Delete'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      ) ??
                                                                                                      false;
                                                                                                  if (confirmDialogResponse) {
                                                                                                    await actions.removeRecordItem(
                                                                                                      context,
                                                                                                    );
                                                                                                    await actions.refreshListView(
                                                                                                      context,
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.delete,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 27.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final recmon = FFAppState().Recordlist.toList();

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        reverse: true,
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: recmon.length,
                                                                                        itemBuilder: (context, recmonIndex) {
                                                                                          final recmonItem = recmon[recmonIndex];
                                                                                          return Visibility(
                                                                                            visible: dateTimeFormat(
                                                                                                  "yMd",
                                                                                                  recmonItem.date,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ) ==
                                                                                                dateTimeFormat(
                                                                                                  "yMd",
                                                                                                  _model.calendarSelectedDay1?.start,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  FFAppState().currentURL = recmonItem.audiofile;
                                                                                                  safeSetState(() {});
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => FocusScope.of(context).unfocus(),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                          child: NoteWidget(
                                                                                                            jms: recmonItem.date!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: const [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 8.0, 2.0, 8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 220.0,
                                                                                                              height: 28.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsets.all(5.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Builder(
                                                                                                                          builder: (context) {
                                                                                                                            if (recmonItem.check) {
                                                                                                                              return Align(
                                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      FFAppState().updateRecordlistAtIndex(
                                                                                                                                        recmonIndex,
                                                                                                                                        (e) => e..check = false,
                                                                                                                                      );
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      width: 18.0,
                                                                                                                                      height: 18.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                                                        shape: BoxShape.rectangle,
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          width: 2.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                                      child: Align(
                                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                        child: FaIcon(
                                                                                                                                          FontAwesomeIcons.check,
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          size: 14.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            } else {
                                                                                                                              return Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    FFAppState().updateRecordlistAtIndex(
                                                                                                                                      recmonIndex,
                                                                                                                                      (e) => e..check = true,
                                                                                                                                    );
                                                                                                                                    safeSetState(() {});
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    width: 18.0,
                                                                                                                                    height: 18.0,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                                      border: Border.all(
                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        width: 2.0,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          if (recmonItem.nameedit) {
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                shape: BoxShape.rectangle,
                                                                                                                              ),
                                                                                                                              child: NameWidget(
                                                                                                                                key: Key('Key7dp_${recmonIndex}_of_${recmon.length}'),
                                                                                                                                parameter1: recmonIndex,
                                                                                                                                parameter2: valueOrDefault<String>(
                                                                                                                                  recmonItem.name,
                                                                                                                                  'Untitled',
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          } else {
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                              height: 25.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                                shape: BoxShape.rectangle,
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  width: 0.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    recmonItem.name,
                                                                                                                                    'Untitled',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Manrope',
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          }
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 40.0,
                                                                                                                    height: 66.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                    ),
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: FFButtonWidget(
                                                                                                                        onPressed: () async {
                                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                context: context,
                                                                                                                                builder: (alertDialogContext) {
                                                                                                                                  return AlertDialog(
                                                                                                                                    title: const Text('Rename?'),
                                                                                                                                    content: const Text('Do you want to rename this item?'),
                                                                                                                                    actions: [
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                        child: const Text('Cancle'),
                                                                                                                                      ),
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                        child: const Text('Rename'),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ) ??
                                                                                                                              false;
                                                                                                                          if (confirmDialogResponse) {
                                                                                                                            FFAppState().updateRecordlistAtIndex(
                                                                                                                              recmonIndex,
                                                                                                                              (e) => e..nameedit = true,
                                                                                                                            );
                                                                                                                            safeSetState(() {});
                                                                                                                            await actions.refreshListView(
                                                                                                                              context,
                                                                                                                            );
                                                                                                                          }
                                                                                                                        },
                                                                                                                        text: '',
                                                                                                                        icon: Icon(
                                                                                                                          Icons.edit,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        options: FFButtonOptions(
                                                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: Colors.white,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                          elevation: 0.0,
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 0.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 40.0,
                                                                                                                    height: 66.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                    ),
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: FFButtonWidget(
                                                                                                                        onPressed: () async {
                                                                                                                          await actions.shareAudioFile(
                                                                                                                            recmonItem.audiofile,
                                                                                                                          );
                                                                                                                          await actions.refreshListView(
                                                                                                                            context,
                                                                                                                          );
                                                                                                                        },
                                                                                                                        text: '',
                                                                                                                        icon: Icon(
                                                                                                                          Icons.share,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        options: FFButtonOptions(
                                                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: Colors.white,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                          elevation: 0.0,
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 0.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Builder(
                                                                                                                    builder: (context) {
                                                                                                                      if (recmonItem.favorite) {
                                                                                                                        return Align(
                                                                                                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                          child: InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                    context: context,
                                                                                                                                    builder: (alertDialogContext) {
                                                                                                                                      return AlertDialog(
                                                                                                                                        title: const Text('Remove?'),
                                                                                                                                        content: const Text('Do you want to remove this item from your favorites?'),
                                                                                                                                        actions: [
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                            child: const Text('Cancel'),
                                                                                                                                          ),
                                                                                                                                          TextButton(
                                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                            child: const Text('Remove'),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ) ??
                                                                                                                                  false;
                                                                                                                              if (confirmDialogResponse) {
                                                                                                                                FFAppState().favorite = false;
                                                                                                                                safeSetState(() {});
                                                                                                                                FFAppState().updateRecordlistAtIndex(
                                                                                                                                  recmonIndex,
                                                                                                                                  (e) => e..favorite = FFAppState().favorite,
                                                                                                                                );
                                                                                                                                safeSetState(() {});
                                                                                                                              }
                                                                                                                              FFAppState().favorite = false;
                                                                                                                              safeSetState(() {});
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: 40.0,
                                                                                                                              height: 39.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                                                shape: BoxShape.rectangle,
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  width: 2.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Align(
                                                                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.5, 0.0, 0.0, 0.0),
                                                                                                                                  child: Icon(
                                                                                                                                    Icons.star_rate,
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    size: 25.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      } else {
                                                                                                                        return FFButtonWidget(
                                                                                                                          onPressed: () async {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return AlertDialog(
                                                                                                                                      title: const Text('Add?'),
                                                                                                                                      content: const Text('Do you want to add this item to your favorites?'),
                                                                                                                                      actions: [
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                          child: const Text('Cancel'),
                                                                                                                                        ),
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                          child: const Text('Add'),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ) ??
                                                                                                                                false;
                                                                                                                            if (confirmDialogResponse) {
                                                                                                                              FFAppState().favorite = true;
                                                                                                                              safeSetState(() {});
                                                                                                                              FFAppState().updateRecordlistAtIndex(
                                                                                                                                recmonIndex,
                                                                                                                                (e) => e..favorite = FFAppState().favorite,
                                                                                                                              );
                                                                                                                              safeSetState(() {});
                                                                                                                              safeSetState(() {
                                                                                                                                _model.tabBarController1!.animateTo(
                                                                                                                                  _model.tabBarController1!.length - 1,
                                                                                                                                  duration: const Duration(milliseconds: 300),
                                                                                                                                  curve: Curves.ease,
                                                                                                                                );
                                                                                                                              });
                                                                                                                            }
                                                                                                                            FFAppState().favorite = false;
                                                                                                                            safeSetState(() {});
                                                                                                                          },
                                                                                                                          text: '',
                                                                                                                          icon: Icon(
                                                                                                                            Icons.star_outline,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                          options: FFButtonOptions(
                                                                                                                            width: 40.0,
                                                                                                                            height: 39.0,
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                  fontFamily: 'Manrope',
                                                                                                                                  color: Colors.white,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                            elevation: 0.0,
                                                                                                                            borderSide: BorderSide(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              width: 0.0,
                                                                                                                            ),
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      }
                                                                                                                    },
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                    child: Card(
                                                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                                                      elevation: 0.0,
                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                                              child: Text(
                                                                                                                                dateTimeFormat(
                                                                                                                                  "jms",
                                                                                                                                  recmonItem.date!,
                                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'Manrope',
                                                                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                      fontSize: 12.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    dateTimeFormat(
                                                                                                                      "yMd",
                                                                                                                      recmonItem.date!,
                                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: 'Manrope',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    recmonItem.favorite.toString(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Manrope',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          fontSize: 1.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: 120.0,
                                                                                                                height: 60.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  shape: BoxShape.rectangle,
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                  children: [
                                                                                                                    Align(
                                                                                                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        height: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          shape: BoxShape.rectangle,
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Stack(
                                                                                                                          children: [
                                                                                                                            Align(
                                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                          context: context,
                                                                                                                                          builder: (alertDialogContext) {
                                                                                                                                            return AlertDialog(
                                                                                                                                              title: const Text('Save?'),
                                                                                                                                              content: const Text('Save this item and stop auto-delete?'),
                                                                                                                                              actions: [
                                                                                                                                                TextButton(
                                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                                  child: const Text('Cancel'),
                                                                                                                                                ),
                                                                                                                                                TextButton(
                                                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                                  child: const Text('Save'),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ) ??
                                                                                                                                        false;
                                                                                                                                    if (confirmDialogResponse) {
                                                                                                                                      FFAppState().updateRecordlistAtIndex(
                                                                                                                                        recmonIndex,
                                                                                                                                        (e) => e..save = true,
                                                                                                                                      );
                                                                                                                                      safeSetState(() {});
                                                                                                                                    }
                                                                                                                                  },
                                                                                                                                  text: '',
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.save_outlined,
                                                                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                    size: 25.0,
                                                                                                                                  ),
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                                    height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                          fontFamily: 'Manrope',
                                                                                                                                          color: Colors.white,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderSide: BorderSide(
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                      width: 0.0,
                                                                                                                                    ),
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            if (recmonItem.save)
                                                                                                                              Align(
                                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 2.0, 0.3),
                                                                                                                                  child: Icon(
                                                                                                                                    Icons.save,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        width: 50.0,
                                                                                                                        height: 50.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          shape: BoxShape.rectangle,
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: InkWell(
                                                                                                                          splashColor: Colors.transparent,
                                                                                                                          focusColor: Colors.transparent,
                                                                                                                          hoverColor: Colors.transparent,
                                                                                                                          highlightColor: Colors.transparent,
                                                                                                                          onTap: () async {
                                                                                                                            _model.recordedfile1 = await actions.pathToFile(
                                                                                                                              recmonItem.audiofile,
                                                                                                                            );
                                                                                                                            await Future.wait([
                                                                                                                              Future(() async {
                                                                                                                                _model.apiRequestBuildship = await TranscribeMeetingCall.call(
                                                                                                                                  buffer: _model.recordedfile1,
                                                                                                                                  startTime: _model.startTime?.toString(),
                                                                                                                                  endTime: _model.endTime?.toString(),
                                                                                                                                );

                                                                                                                                if ((_model.apiRequestBuildship?.succeeded ?? true)) {
                                                                                                                                  _model.responseReceived = true;
                                                                                                                                  safeSetState(() {});
                                                                                                                                  FFAppState().addToItems(ItemStruct.maybeFromMap((_model.apiRequestBuildship?.jsonBody ?? ''))!);
                                                                                                                                  safeSetState(() {});
                                                                                                                                } else {
                                                                                                                                  _model.responseReceived = true;
                                                                                                                                  safeSetState(() {});
                                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                    SnackBar(
                                                                                                                                      content: Text(
                                                                                                                                        'Error getting transcription: ${(_model.apiRequestBuildship?.statusCode ?? 200).toString()}',
                                                                                                                                        style: TextStyle(
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                    ),
                                                                                                                                  );
                                                                                                                                }
                                                                                                                              }),
                                                                                                                              Future(() async {
                                                                                                                                safeSetState(() {
                                                                                                                                  _model.tabBarController1!.animateTo(
                                                                                                                                    min(_model.tabBarController1!.length - 1, _model.tabBarController1!.index + 1),
                                                                                                                                    duration: const Duration(milliseconds: 300),
                                                                                                                                    curve: Curves.ease,
                                                                                                                                  );
                                                                                                                                });
                                                                                                                              }),
                                                                                                                            ]);

                                                                                                                            safeSetState(() {});
                                                                                                                          },
                                                                                                                          child: Icon(
                                                                                                                            Icons.text_fields,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 24.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    blurRadius: 3.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      1.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              child: FlutterFlowCalendar(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                iconColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                weekFormat: true,
                                                                                weekStartsMonday: true,
                                                                                onChange: (DateTimeRange? newSelectedDate) {
                                                                                  safeSetState(() => _model.calendarSelectedDay2 = newSelectedDate);
                                                                                },
                                                                                titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                dayOfWeekStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                      height: 38.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: const [
                                                                                          BoxShadow(
                                                                                            blurRadius: 4.0,
                                                                                            color: Color(0x33000000),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              2.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'vr37l074' /* Recording list */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                              ),
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      _model.idx = 0;
                                                                                                      safeSetState(() {});
                                                                                                      while (_model.idx! < FFAppState().Recordlist.length) {
                                                                                                        FFAppState().updateRecordlistAtIndex(
                                                                                                          _model.idx!,
                                                                                                          (e) => e..check = _model.chkAll ? false : true,
                                                                                                        );
                                                                                                        FFAppState().update(() {});
                                                                                                        _model.idx = _model.idx! + 1;
                                                                                                        safeSetState(() {});
                                                                                                      }
                                                                                                      _model.chkAll = !_model.chkAll;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    text: '',
                                                                                                    icon: Icon(
                                                                                                      Icons.checklist_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 27.0,
                                                                                                    ),
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 50.0,
                                                                                                      height: 40.0,
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        width: 0.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(24.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return AlertDialog(
                                                                                                                    title: const Text('Delete?'),
                                                                                                                    content: const Text('Do you want to delete this item?'),
                                                                                                                    actions: [
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                        child: const Text('Cancel'),
                                                                                                                      ),
                                                                                                                      TextButton(
                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                        child: const Text('Delete'),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  );
                                                                                                                },
                                                                                                              ) ??
                                                                                                              false;
                                                                                                          if (confirmDialogResponse) {
                                                                                                            await actions.removeRecordItem(
                                                                                                              context,
                                                                                                            );
                                                                                                            await actions.refreshListView(
                                                                                                              context,
                                                                                                            );
                                                                                                          }
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          Icons.delete,
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                          size: 27.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final recweek = FFAppState().Recordlist.toList();

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        reverse: true,
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: recweek.length,
                                                                                        itemBuilder: (context, recweekIndex) {
                                                                                          final recweekItem = recweek[recweekIndex];
                                                                                          return Visibility(
                                                                                            visible: dateTimeFormat(
                                                                                                  "yMd",
                                                                                                  _model.calendarSelectedDay2?.start,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ) ==
                                                                                                dateTimeFormat(
                                                                                                  "yMd",
                                                                                                  recweekItem.date,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                                                                                              child: InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  FFAppState().currentURL = recweekItem.audiofile;
                                                                                                  safeSetState(() {});
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return GestureDetector(
                                                                                                        onTap: () => FocusScope.of(context).unfocus(),
                                                                                                        child: Padding(
                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                          child: NoteWidget(
                                                                                                            jms: recweekItem.date!,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 100.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: const [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 8.0, 2.0, 8.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 220.0,
                                                                                                              height: 28.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsets.all(5.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Builder(
                                                                                                                          builder: (context) {
                                                                                                                            if (recweekItem.check) {
                                                                                                                              return Align(
                                                                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      FFAppState().updateRecordlistAtIndex(
                                                                                                                                        recweekIndex,
                                                                                                                                        (e) => e..check = false,
                                                                                                                                      );
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      width: 18.0,
                                                                                                                                      height: 18.0,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                                                                        shape: BoxShape.rectangle,
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          width: 2.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                                      child: Align(
                                                                                                                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                                        child: FaIcon(
                                                                                                                                          FontAwesomeIcons.check,
                                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                                          size: 14.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            } else {
                                                                                                                              return Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                child: InkWell(
                                                                                                                                  splashColor: Colors.transparent,
                                                                                                                                  focusColor: Colors.transparent,
                                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                                  onTap: () async {
                                                                                                                                    FFAppState().updateRecordlistAtIndex(
                                                                                                                                      recweekIndex,
                                                                                                                                      (e) => e..check = true,
                                                                                                                                    );
                                                                                                                                    safeSetState(() {});
                                                                                                                                  },
                                                                                                                                  child: Container(
                                                                                                                                    width: 18.0,
                                                                                                                                    height: 18.0,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                                      border: Border.all(
                                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                                        width: 2.0,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          if (recweekItem.nameedit) {
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                shape: BoxShape.rectangle,
                                                                                                                              ),
                                                                                                                              child: NameWidget(
                                                                                                                                key: Key('Keyywi_${recweekIndex}_of_${recweek.length}'),
                                                                                                                                parameter1: recweekIndex,
                                                                                                                                parameter2: valueOrDefault<String>(
                                                                                                                                  recweekItem.name,
                                                                                                                                  'Untitled',
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          } else {
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                              height: 25.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                                shape: BoxShape.rectangle,
                                                                                                                                border: Border.all(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  width: 0.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    recweekItem.name,
                                                                                                                                    'Untitled',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'Manrope',
                                                                                                                                        fontSize: 12.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          }
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 40.0,
                                                                                                                    height: 66.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                    ),
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: FFButtonWidget(
                                                                                                                        onPressed: () async {
                                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                context: context,
                                                                                                                                builder: (alertDialogContext) {
                                                                                                                                  return AlertDialog(
                                                                                                                                    title: const Text('Rename?'),
                                                                                                                                    content: const Text('Do you want to rename this item?'),
                                                                                                                                    actions: [
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                        child: const Text('Cancle'),
                                                                                                                                      ),
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                        child: const Text('Rename'),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ) ??
                                                                                                                              false;
                                                                                                                          if (confirmDialogResponse) {
                                                                                                                            FFAppState().updateRecordlistAtIndex(
                                                                                                                              recweekIndex,
                                                                                                                              (e) => e..nameedit = true,
                                                                                                                            );
                                                                                                                            safeSetState(() {});
                                                                                                                            await actions.refreshListView(
                                                                                                                              context,
                                                                                                                            );
                                                                                                                          }
                                                                                                                        },
                                                                                                                        text: '',
                                                                                                                        icon: Icon(
                                                                                                                          Icons.edit,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        options: FFButtonOptions(
                                                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: Colors.white,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                          elevation: 0.0,
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 0.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    width: 40.0,
                                                                                                                    height: 66.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      shape: BoxShape.rectangle,
                                                                                                                    ),
                                                                                                                    child: Align(
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: FFButtonWidget(
                                                                                                                        onPressed: () async {
                                                                                                                          await actions.shareAudioFile(
                                                                                                                            recweekItem.audiofile,
                                                                                                                          );
                                                                                                                          await actions.refreshListView(
                                                                                                                            context,
                                                                                                                          );
                                                                                                                        },
                                                                                                                        text: '',
                                                                                                                        icon: Icon(
                                                                                                                          Icons.share,
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 20.0,
                                                                                                                        ),
                                                                                                                        options: FFButtonOptions(
                                                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: Colors.white,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                          elevation: 0.0,
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 0.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    width: 38.0,
                                                                                                                    height: 40.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    child: Stack(
                                                                                                                      children: [
                                                                                                                        FFButtonWidget(
                                                                                                                          onPressed: () async {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return AlertDialog(
                                                                                                                                      title: const Text('Add?'),
                                                                                                                                      content: const Text('Do you want to add this item to your favorites?'),
                                                                                                                                      actions: [
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                          child: const Text('Cancel'),
                                                                                                                                        ),
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                          child: const Text('Add'),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ) ??
                                                                                                                                false;
                                                                                                                            if (confirmDialogResponse) {
                                                                                                                              FFAppState().favorite = true;
                                                                                                                              safeSetState(() {});
                                                                                                                              FFAppState().updateRecordlistAtIndex(
                                                                                                                                recweekIndex,
                                                                                                                                (e) => e..favorite = FFAppState().favorite,
                                                                                                                              );
                                                                                                                              safeSetState(() {});
                                                                                                                              safeSetState(() {
                                                                                                                                _model.tabBarController1!.animateTo(
                                                                                                                                  _model.tabBarController1!.length - 1,
                                                                                                                                  duration: const Duration(milliseconds: 300),
                                                                                                                                  curve: Curves.ease,
                                                                                                                                );
                                                                                                                              });
                                                                                                                            }
                                                                                                                            FFAppState().favorite = false;
                                                                                                                            safeSetState(() {});
                                                                                                                          },
                                                                                                                          text: '',
                                                                                                                          icon: Icon(
                                                                                                                            Icons.star_outline,
                                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                                            size: 25.0,
                                                                                                                          ),
                                                                                                                          options: FFButtonOptions(
                                                                                                                            width: 50.0,
                                                                                                                            height: 85.0,
                                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                  fontFamily: 'Manrope',
                                                                                                                                  color: Colors.white,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                            elevation: 0.0,
                                                                                                                            borderSide: BorderSide(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              width: 0.0,
                                                                                                                            ),
                                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                                            hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        if (recweekItem.favorite)
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 7.0, 0.0, 6.0),
                                                                                                                              child: Icon(
                                                                                                                                Icons.star,
                                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                size: 24.0,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                    child: Card(
                                                                                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                                      color: FlutterFlowTheme.of(context).accent3,
                                                                                                                      elevation: 0.0,
                                                                                                                      shape: RoundedRectangleBorder(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                                                        child: Text(
                                                                                                                          dateTimeFormat(
                                                                                                                            "jms",
                                                                                                                            recweekItem.date!,
                                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'Manrope',
                                                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                                                fontSize: 12.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    dateTimeFormat(
                                                                                                                      "yMd",
                                                                                                                      recweekItem.date!,
                                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: 'Manrope',
                                                                                                                          letterSpacing: 0.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 120.0,
                                                                                                              height: 60.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                shape: BoxShape.rectangle,
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: 50.0,
                                                                                                                      height: 50.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        shape: BoxShape.rectangle,
                                                                                                                        border: Border.all(
                                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                                          width: 1.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: Stack(
                                                                                                                        children: [
                                                                                                                          Align(
                                                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Padding(
                                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                              child: FFButtonWidget(
                                                                                                                                onPressed: () async {
                                                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                        context: context,
                                                                                                                                        builder: (alertDialogContext) {
                                                                                                                                          return AlertDialog(
                                                                                                                                            title: const Text('Save?'),
                                                                                                                                            content: const Text('Save this item and stop auto-delete?'),
                                                                                                                                            actions: [
                                                                                                                                              TextButton(
                                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                                child: const Text('Cancel'),
                                                                                                                                              ),
                                                                                                                                              TextButton(
                                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                                child: const Text('Save'),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          );
                                                                                                                                        },
                                                                                                                                      ) ??
                                                                                                                                      false;
                                                                                                                                  if (confirmDialogResponse) {
                                                                                                                                    FFAppState().save = true;
                                                                                                                                    safeSetState(() {});
                                                                                                                                    FFAppState().updateRecordlistAtIndex(
                                                                                                                                      recweekIndex,
                                                                                                                                      (e) => e..save = FFAppState().save,
                                                                                                                                    );
                                                                                                                                    safeSetState(() {});
                                                                                                                                  }
                                                                                                                                  FFAppState().save = false;
                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                text: '',
                                                                                                                                icon: Icon(
                                                                                                                                  Icons.save_outlined,
                                                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                                                  size: 25.0,
                                                                                                                                ),
                                                                                                                                options: FFButtonOptions(
                                                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                                                  height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                                        fontFamily: 'Manrope',
                                                                                                                                        color: Colors.white,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                  elevation: 0.0,
                                                                                                                                  borderSide: BorderSide(
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                    width: 0.0,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          if (recweekItem.save)
                                                                                                                            Align(
                                                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: Padding(
                                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.3),
                                                                                                                                child: Icon(
                                                                                                                                  Icons.save,
                                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  size: 24.0,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                                                                                                    child: Container(
                                                                                                                      width: 50.0,
                                                                                                                      height: 50.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        shape: BoxShape.rectangle,
                                                                                                                        border: Border.all(
                                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                                          width: 1.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          _model.recordedfile = await actions.pathToFile(
                                                                                                                            recweekItem.audiofile,
                                                                                                                          );
                                                                                                                          await Future.wait([
                                                                                                                            Future(() async {
                                                                                                                              _model.apiRequestBuildship1 = await TranscribeMeetingCall.call(
                                                                                                                                buffer: _model.recordedfile,
                                                                                                                                startTime: _model.startTime?.toString(),
                                                                                                                                endTime: _model.endTime?.toString(),
                                                                                                                              );

                                                                                                                              if ((_model.apiRequestBuildship1?.succeeded ?? true)) {
                                                                                                                                _model.responseReceived = true;
                                                                                                                                safeSetState(() {});
                                                                                                                                FFAppState().addToItems(ItemStruct.maybeFromMap((_model.apiRequestBuildship1?.jsonBody ?? ''))!);
                                                                                                                                safeSetState(() {});
                                                                                                                              } else {
                                                                                                                                _model.responseReceived = true;
                                                                                                                                safeSetState(() {});
                                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                  SnackBar(
                                                                                                                                    content: Text(
                                                                                                                                      'Error getting transcription: ${(_model.apiRequestBuildship1?.statusCode ?? 200).toString()}',
                                                                                                                                      style: TextStyle(
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              }
                                                                                                                            }),
                                                                                                                            Future(() async {
                                                                                                                              safeSetState(() {
                                                                                                                                _model.tabBarController1!.animateTo(
                                                                                                                                  min(_model.tabBarController1!.length - 1, _model.tabBarController1!.index + 1),
                                                                                                                                  duration: const Duration(milliseconds: 300),
                                                                                                                                  curve: Curves.ease,
                                                                                                                                );
                                                                                                                              });
                                                                                                                            }),
                                                                                                                          ]);

                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.text_fields,
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: SizedBox(
                                                        height: 34.0,
                                                        child: Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () async {
                                                                    _model.isShowFullList =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    await actions
                                                                        .resetAllFilters(
                                                                      context,
                                                                    );
                                                                    await actions
                                                                        .updateFilterForSearchResults(
                                                                      context,
                                                                      _model
                                                                          .simpleSearchResults
                                                                          .toList(),
                                                                    );
                                                                    await actions
                                                                        .refreshListView(
                                                                      context,
                                                                    );
                                                                  },
                                                                ),
                                                                onFieldSubmitted:
                                                                    (_) async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .simpleSearchResults = TextSearch(FFAppState()
                                                                            .items
                                                                            .map((e) => e
                                                                                .transcription)
                                                                            .toList()
                                                                            .map((str) =>
                                                                                TextSearchItem.fromTerms(str, [
                                                                                  str
                                                                                ]))
                                                                            .toList())
                                                                        .search(_model
                                                                            .textController
                                                                            .text)
                                                                        .map((r) =>
                                                                            r.object)
                                                                        .toList();
                                                                  });
                                                                  _model.isShowFullList =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  await actions
                                                                      .updateFilterForSearchResults(
                                                                    context,
                                                                    _model
                                                                        .simpleSearchResults
                                                                        .toList(),
                                                                  );
                                                                  await actions
                                                                      .refreshListView(
                                                                    context,
                                                                  );
                                                                  await actions
                                                                      .resetAllFilters(
                                                                    context,
                                                                  );
                                                                },
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '9rt4o846' /* Search for recordings.. */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  errorBorder:
                                                                      const UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      const UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              4.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  suffixIcon: _model
                                                                          .textController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.textController?.clear();
                                                                            _model.isShowFullList =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            await actions.resetAllFilters(
                                                                              context,
                                                                            );
                                                                            await actions.updateFilterForSearchResults(
                                                                              context,
                                                                              _model.simpleSearchResults.toList(),
                                                                            );
                                                                            await actions.refreshListView(
                                                                              context,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                validator: _model
                                                                    .textControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  40.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (_model
                                                                    .isShowFullList) {
                                                                  return SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (valueOrDefault<
                                                                            bool>(
                                                                          _model.responseSent! &&
                                                                              !_model.responseReceived!,
                                                                          false,
                                                                        ))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.transcribeItemModel1,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: const TranscribeItemWidget(),
                                                                            ).animateOnPageLoad(animationsMap['transcribeItemOnPageLoadAnimation1']!),
                                                                          ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final items =
                                                                                FFAppState().items.toList();
                                                                            if (items.isEmpty) {
                                                                              return const Center(
                                                                                child: EmptyComponentWidget(),
                                                                              );
                                                                            }

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              reverse: true,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: items.length,
                                                                              separatorBuilder: (_, __) => const SizedBox(height: 4.0),
                                                                              itemBuilder: (context, itemsIndex) {
                                                                                final itemsItem = items[itemsIndex];
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: MeetingDetailsWidget(
                                                                                              item: itemsItem,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  onLongPress: () async {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: const Text('Delete?'),
                                                                                              content: const Text('Do you want to delete this item?'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: const Text('Cancel'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: const Text('Delete'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      FFAppState().removeAtIndexFromItems(itemsIndex);
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: TranscribeItemWidget(
                                                                                    key: Key('Keyhwk_${itemsIndex}_of_${items.length}'),
                                                                                    item: itemsItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return SingleChildScrollView(
                                                                    primary:
                                                                        false,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (valueOrDefault<
                                                                            bool>(
                                                                          _model.responseSent! &&
                                                                              !_model.responseReceived!,
                                                                          false,
                                                                        ))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                4.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.transcribeItemModel3,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: const TranscribeItemWidget(),
                                                                            ).animateOnPageLoad(animationsMap['transcribeItemOnPageLoadAnimation2']!),
                                                                          ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final items =
                                                                                FFAppState().items.where((e) => e.filter).toList();
                                                                            if (items.isEmpty) {
                                                                              return const Center(
                                                                                child: EmptyComponentWidget(),
                                                                              );
                                                                            }

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              reverse: true,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: items.length,
                                                                              separatorBuilder: (_, __) => const SizedBox(height: 4.0),
                                                                              itemBuilder: (context, itemsIndex) {
                                                                                final itemsItem = items[itemsIndex];
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: MeetingDetailsWidget(
                                                                                              item: itemsItem,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                  onLongPress: () async {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: const Text('Delete?'),
                                                                                              content: const Text('Do you want to delete this item?'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: const Text('Cancel'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: const Text('Delete'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      FFAppState().removeAtIndexFromItems(itemsIndex);
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  },
                                                                                  child: TranscribeItemWidget(
                                                                                    key: Key('Key06b_${itemsIndex}_of_${items.length}'),
                                                                                    item: itemsItem,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 24.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.95,
                                                          height: 38.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'pc7r3yo0' /* Favorites List */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final favorite =
                                                              FFAppState()
                                                                  .Recordlist
                                                                  .where((e) =>
                                                                      e.favorite)
                                                                  .toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            reverse: true,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                favorite.length,
                                                            itemBuilder: (context,
                                                                favoriteIndex) {
                                                              final favoriteItem =
                                                                  favorite[
                                                                      favoriteIndex];
                                                              return Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                            .currentURL =
                                                                        favoriteItem
                                                                            .audiofile;
                                                                    safeSetState(
                                                                        () {});
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () =>
                                                                              FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                NoteWidget(
                                                                              jms: favoriteItem.date!,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              3.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            1.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          8.0,
                                                                          2.0,
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 277.0,
                                                                                height: 40.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(5.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 38.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: FFButtonWidget(
                                                                                          onPressed: () {
                                                                                            print('Button pressed ...');
                                                                                          },
                                                                                          text: '',
                                                                                          icon: Icon(
                                                                                            Icons.star,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            size: 25.0,
                                                                                          ),
                                                                                          options: FFButtonOptions(
                                                                                            width: 50.0,
                                                                                            height: 85.0,
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              width: 0.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          height: 25.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            shape: BoxShape.rectangle,
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              width: 0.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                favoriteItem.name,
                                                                                                'Untitled',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 40.0,
                                                                                        height: 66.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          shape: BoxShape.rectangle,
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              await actions.shareAudioFile(
                                                                                                favoriteItem.audiofile,
                                                                                              );
                                                                                              await actions.refreshListView(
                                                                                                context,
                                                                                              );
                                                                                            },
                                                                                            text: '',
                                                                                            icon: Icon(
                                                                                              Icons.share,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    color: Colors.white,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                width: 0.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              hoverTextColor: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 38.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Card(
                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                        color: FlutterFlowTheme.of(context).accent3,
                                                                                        elevation: 0.0,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                          child: Text(
                                                                                            dateTimeFormat(
                                                                                              "jms",
                                                                                              favoriteItem.date!,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        "yMd",
                                                                                        favoriteItem.date!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  shape: BoxShape.rectangle,
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.recordedfile3 = await actions.pathToFile(
                                                                                      favoriteItem.audiofile,
                                                                                    );
                                                                                    await Future.wait([
                                                                                      Future(() async {
                                                                                        _model.apiRequestBuildship2 = await TranscribeMeetingCall.call(
                                                                                          buffer: _model.recordedfile3,
                                                                                          startTime: _model.startTime?.toString(),
                                                                                          endTime: _model.endTime?.toString(),
                                                                                        );

                                                                                        if ((_model.apiRequestBuildship2?.succeeded ?? true)) {
                                                                                          _model.responseReceived = true;
                                                                                          safeSetState(() {});
                                                                                          FFAppState().addToItems(ItemStruct.maybeFromMap((_model.apiRequestBuildship2?.jsonBody ?? ''))!);
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          _model.responseReceived = true;
                                                                                          safeSetState(() {});
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Error getting transcription: ${(_model.apiRequestBuildship2?.statusCode ?? 200).toString()}',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      }),
                                                                                      Future(() async {
                                                                                        safeSetState(() {
                                                                                          _model.tabBarController1!.animateTo(
                                                                                            min(_model.tabBarController1!.length - 1, _model.tabBarController1!.index + 1),
                                                                                            duration: const Duration(milliseconds: 300),
                                                                                            curve: Curves.ease,
                                                                                          );
                                                                                        });
                                                                                      }),
                                                                                    ]);

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.text_fields,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
