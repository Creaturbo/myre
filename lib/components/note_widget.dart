import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'note_model.dart';
export 'note_model.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
    required this.jms,
  });

  final DateTime? jms;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late NoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      -2.0,
                    ),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 3.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Stack(
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                children: const [],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: custom_widgets.AdvanceMusicPlayer(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        initialUrl: FFAppState().currentURL,
                        sliderActiveColor:
                            FlutterFlowTheme.of(context).primaryText,
                        sliderInactiveColor:
                            FlutterFlowTheme.of(context).primaryText,
                        backwardIconPath: FaIcon(
                          FontAwesomeIcons.backward,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        forwardIconPath: FaIcon(
                          FontAwesomeIcons.forward,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        backwardIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        forwardIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        pauseIconPath: FaIcon(
                          FontAwesomeIcons.pause,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        playIconPath: FaIcon(
                          FontAwesomeIcons.play,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        pauseIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        playIconColor: FlutterFlowTheme.of(context).primaryText,
                        loopIconPath: Icon(
                          Icons.repeat_one,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        loopIconColor: FlutterFlowTheme.of(context).primaryText,
                        shuffleIconPath: Icon(
                          Icons.shuffle,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        shuffleIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        playbackDurationTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                        previousIconPath: Icon(
                          Icons.skip_previous,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        nextIconPath: Icon(
                          Icons.skip_next,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        previousIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        nextIconColor: FlutterFlowTheme.of(context).primaryText,
                        loopIconPressedPath: Icon(
                          Icons.repeat_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        shuffleIconPressedPath: Icon(
                          Icons.view_list,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        speakerOnIconPath: Icon(
                          Icons.record_voice_over_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        speakerOffIconPath: Icon(
                          Icons.voice_over_off_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        speakerOnIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        speakerOffIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                        dropdownTextColor:
                            FlutterFlowTheme.of(context).primaryText,
                        timerIcon: Icon(
                          Icons.access_time_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        musicUrls: FFAppState()
                            .Recordlist
                            .map((e) => e.audiofile)
                            .toList(),
                        waveformIconPath: Icon(
                          Icons.graphic_eq,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        waveformIconColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 44.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'ov6c9vdr' /* Close */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
