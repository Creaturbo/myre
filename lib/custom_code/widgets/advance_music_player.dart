// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:rxdart/rxdart.dart';

class AdvanceMusicPlayer extends StatefulWidget {
  const AdvanceMusicPlayer({
    Key? key,
    this.width,
    this.height,
    required this.initialUrl,
    required this.musicUrls,
    required this.sliderActiveColor,
    required this.sliderInactiveColor,
    required this.backwardIconPath,
    required this.forwardIconPath,
    required this.backwardIconColor,
    required this.forwardIconColor,
    required this.pauseIconPath,
    required this.playIconPath,
    required this.pauseIconColor,
    required this.playIconColor,
    required this.loopIconPath,
    required this.loopIconColor,
    required this.shuffleIconPath,
    required this.shuffleIconColor,
    required this.playbackDurationTextColor,
    required this.previousIconPath,
    required this.nextIconPath,
    required this.previousIconColor,
    required this.nextIconColor,
    required this.loopIconPressedPath,
    required this.shuffleIconPressedPath,
    required this.speakerOnIconPath,
    required this.speakerOffIconPath,
    required this.speakerOnIconColor,
    required this.speakerOffIconColor,
    required this.dropdownTextColor,
    required this.timerIcon,
    required this.waveformIconPath,
    required this.waveformIconColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String initialUrl;
  final List<String> musicUrls;
  final Color sliderActiveColor;
  final Color sliderInactiveColor;
  final Widget backwardIconPath;
  final Widget forwardIconPath;
  final Color backwardIconColor;
  final Color forwardIconColor;
  final Widget pauseIconPath;
  final Widget playIconPath;
  final Color pauseIconColor;
  final Color playIconColor;
  final Widget loopIconPath;
  final Color loopIconColor;
  final Widget shuffleIconPath;
  final Color shuffleIconColor;
  final Color playbackDurationTextColor;
  final Widget previousIconPath;
  final Widget nextIconPath;
  final Color previousIconColor;
  final Color nextIconColor;
  final Widget loopIconPressedPath;
  final Widget shuffleIconPressedPath;
  final Widget speakerOnIconPath;
  final Widget speakerOffIconPath;
  final Color speakerOnIconColor;
  final Color speakerOffIconColor;
  final Color dropdownTextColor;
  final Widget timerIcon;
  final Widget waveformIconPath;
  final Color waveformIconColor;

  @override
  _AdvanceMusicPlayerState createState() => _AdvanceMusicPlayerState();
}

class _AdvanceMusicPlayerState extends State<AdvanceMusicPlayer>
    with SingleTickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;
  int currentSongIndex = 0;
  bool isLooping = false;
  bool isShuffling = false;
  bool isSpeakerOn = true;
  bool showWaveform = false;
  String playbackSpeed = 'Normal';
  String currentRecordingName = 'Unknown';
  Map<String, double> speedValues = {
    '0.25x': 0.25,
    '0.5x': 0.5,
    '0.75x': 0.75,
    'Normal': 1.0,
    '1.25x': 1.25,
    '1.5x': 1.5,
    '1.75x': 1.75,
    '2x': 2.0,
  };

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  Duration? selectedTimer;
  final List<Duration> timerOptions = [
    Duration(minutes: 1),
    Duration(minutes: 10),
    Duration(minutes: 15),
    Duration(minutes: 20),
    Duration(minutes: 25),
    Duration(minutes: 30),
    Duration(minutes: 35),
    Duration(minutes: 40),
    Duration(minutes: 45),
    Duration(minutes: 50),
    Duration(minutes: 55),
    Duration(minutes: 60),
    Duration(minutes: 90),
    Duration(minutes: 120),
  ];
  Timer? countdownTimer;

  final progressStream = BehaviorSubject<WaveformProgress>();
  Waveform? currentWaveform;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _setInitialUrl();
    audioPlayer.playerStateStream.listen((PlayerState state) {
      setState(() {
        isPlaying = state.playing;
        totalDuration = audioPlayer.duration ?? Duration.zero;
        currentPosition = audioPlayer.position ?? Duration.zero;
      });

      if (state.processingState == ProcessingState.completed) {
        playNext();
      }

      if (state.playing) {
        setState(() {
          FFAppState().currentURL = widget.musicUrls[currentSongIndex];
        });
      }
    });

    audioPlayer.positionStream.listen((position) {
      setState(() {
        currentPosition = position;
      });

      if (selectedTimer != null && currentPosition >= selectedTimer!) {
        audioPlayer.pause();
        setState(() {
          selectedTimer = null;
        });
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  void _setInitialUrl() async {
    try {
      await audioPlayer.setUrl(widget.initialUrl);
      setState(() {
        FFAppState().currentURL = widget.initialUrl;
        currentRecordingName = getCurrentRecordingName();
      });
      _initWaveform(widget.initialUrl);
    } catch (error) {
      print('An error occurred while loading the initial audio URL: $error');
    }
  }

  Future<void> _initWaveform(String audioUrl) async {
    try {
      final audioFile = File(audioUrl);
      final waveFile =
          File(p.join((await getTemporaryDirectory()).path, 'waveform.wave'));

      JustWaveform.extract(
        audioInFile: audioFile,
        waveOutFile: waveFile,
        zoom: const WaveformZoom.pixelsPerSecond(100),
      ).listen((waveformProgress) {
        setState(() {
          currentWaveform = waveformProgress.waveform;
        });
        progressStream.add(waveformProgress);
      }, onError: (e) {
        progressStream.addError(e);
      });
    } catch (e) {
      progressStream.addError(e);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    _animationController.dispose();
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
    progressStream.close();
    super.dispose();
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  void updatePosition(double value) {
    final newPosition = Duration(milliseconds: value.toInt());
    seekTo(newPosition);
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void skip(Duration duration) {
    final newPosition = currentPosition + duration;
    if (newPosition < Duration.zero) {
      seekTo(Duration.zero);
    } else if (newPosition > totalDuration) {
      seekTo(totalDuration);
    } else {
      seekTo(newPosition);
    }
  }

  void playPrevious() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
    } else {
      currentSongIndex = widget.musicUrls.length - 1;
    }
    _setUrl(widget.musicUrls[currentSongIndex]);
    audioPlayer.play();
  }

  void playNext() {
    if (isShuffling) {
      currentSongIndex = _getRandomIndex();
    } else {
      if (currentSongIndex < widget.musicUrls.length - 1) {
        currentSongIndex++;
      } else {
        currentSongIndex = 0;
      }
    }
    _setUrl(widget.musicUrls[currentSongIndex]);
    audioPlayer.play();
  }

  void _setUrl(String url) async {
    try {
      await audioPlayer.setUrl(url);
      setState(() {
        FFAppState().currentURL = url;
        currentRecordingName = getCurrentRecordingName();
      });
      _initWaveform(url);
    } catch (error) {
      print('An error occurred while setting the audio URL: $error');
    }
  }

  void toggleLooping() {
    setState(() {
      isLooping = !isLooping;
      audioPlayer.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
    });
  }

  void toggleShuffle() {
    setState(() {
      isShuffling = !isShuffling;
    });
  }

  void toggleSpeaker() {
    setState(() {
      isSpeakerOn = !isSpeakerOn;
      if (isSpeakerOn) {
        audioPlayer.setVolume(1.0);
      } else {
        audioPlayer.setVolume(0.0);
      }
    });
  }

  void toggleWaveform() {
    setState(() {
      showWaveform = !showWaveform;
    });
  }

  void setPlaybackSpeed(String speed) {
    double playbackSpeed = speedValues[speed]!;
    audioPlayer.setSpeed(playbackSpeed);
  }

  int _getRandomIndex() {
    final random = Random();
    int randomIndex = currentSongIndex;
    while (randomIndex == currentSongIndex) {
      randomIndex = random.nextInt(widget.musicUrls.length);
    }
    return randomIndex;
  }

  void setTimer(Duration duration) {
    setState(() {
      selectedTimer = duration;
      if (duration == Duration.zero) {
        audioPlayer.pause();
      }
      Navigator.pop(context);
    });
  }

  String getCurrentRecordingName() {
    String currentURL = FFAppState().currentURL;
    for (var record in FFAppState().Recordlist) {
      if (record.audiofile == currentURL) {
        return record.name;
      }
    }
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: toggleSpeaker,
                  icon: isSpeakerOn
                      ? widget.speakerOnIconPath
                      : widget.speakerOffIconPath,
                  color: isSpeakerOn
                      ? widget.speakerOnIconColor
                      : widget.speakerOffIconColor,
                ),
                Text(
                  currentRecordingName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
                DropdownButton<String>(
                  value: playbackSpeed,
                  onChanged: (String? speed) {
                    if (speed != null) {
                      setState(() {
                        playbackSpeed = speed;
                        setPlaybackSpeed(speed);
                      });
                    }
                  },
                  items: speedValues.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: widget.dropdownTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 8),
            if (showWaveform)
              Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: const EdgeInsets.all(16.0),
                width: double.maxFinite,
                child: StreamBuilder<WaveformProgress>(
                  stream: progressStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    final progress = snapshot.data?.progress ?? 0.0;
                    final waveform = snapshot.data?.waveform ?? currentWaveform;
                    if (waveform == null) {
                      return Center(
                        child: Text(
                          '${(100 * progress).toInt()}%',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    }

                    final visibleDuration = Duration(seconds: 10);
                    final start = currentPosition - visibleDuration * 0.5;
                    final end = currentPosition + visibleDuration * 0.5;
                    final actualStart =
                        start < Duration.zero ? Duration.zero : start;
                    final actualEnd = end > totalDuration ? totalDuration : end;

                    return AudioWaveformWidget(
                      waveform: waveform,
                      start: actualStart,
                      duration: visibleDuration,
                      currentPosition: currentPosition,
                      waveColor: Color(0xFF9489F5),
                    );
                  },
                ),
              ),
            SizedBox(height: 8),
            Slider(
              value: currentPosition.inMilliseconds.toDouble(),
              min: 0,
              max: totalDuration.inMilliseconds.toDouble(),
              onChanged: (double value) {
                updatePosition(value);
              },
              activeColor: widget.sliderActiveColor,
              inactiveColor: widget.sliderInactiveColor,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: widget.playbackDurationTextColor),
                ),
                Text(
                  '${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: widget.playbackDurationTextColor),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: playPrevious,
                  icon: widget.previousIconPath,
                  color: widget.previousIconColor,
                ),
                IconButton(
                  onPressed: () => skip(Duration(seconds: -10)),
                  icon: widget.backwardIconPath,
                  color: widget.backwardIconColor,
                ),
                IconButton(
                  onPressed: playPause,
                  icon: isPlaying ? widget.pauseIconPath : widget.playIconPath,
                  color:
                      isPlaying ? widget.pauseIconColor : widget.playIconColor,
                ),
                IconButton(
                  onPressed: () => skip(Duration(seconds: 10)),
                  icon: widget.forwardIconPath,
                  color: widget.forwardIconColor,
                ),
                IconButton(
                  onPressed: playNext,
                  icon: widget.nextIconPath,
                  color: widget.nextIconColor,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: toggleLooping,
                  child: isLooping
                      ? widget.loopIconPressedPath
                      : widget.loopIconPath,
                ),
                GestureDetector(
                  onTap: toggleShuffle,
                  child: isShuffling
                      ? widget.shuffleIconPressedPath
                      : widget.shuffleIconPath,
                ),
                IconButton(
                  icon: widget.waveformIconPath,
                  color: widget.waveformIconColor,
                  iconSize: 30.0,
                  onPressed: toggleWaveform,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Sleep Timer'),
                          content: Container(
                            height: 200,
                            width: 200,
                            child: ListView.builder(
                              itemCount: timerOptions.length,
                              itemBuilder: (BuildContext context, int index) {
                                final duration = timerOptions[index];
                                final minutes = duration.inMinutes;
                                bool isSelected = duration == selectedTimer;
                                return ListTile(
                                  title: Text(
                                    '$minutes minutes',
                                    style: TextStyle(
                                      color: isSelected ? Colors.blue : null,
                                    ),
                                  ),
                                  onTap: () {
                                    setTimer(duration);
                                  },
                                );
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTimer = null;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: widget.timerIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AudioWaveformWidget extends StatelessWidget {
  final Waveform waveform;
  final Duration start;
  final Duration duration;
  final Duration currentPosition;
  final Color waveColor;
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;

  const AudioWaveformWidget({
    Key? key,
    required this.waveform,
    required this.start,
    required this.duration,
    required this.currentPosition,
    this.waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: AudioWaveformPainter(
          waveform: waveform,
          start: start,
          duration: duration,
          waveColor: waveColor,
          scale: scale,
          strokeWidth: strokeWidth,
          pixelsPerStep: pixelsPerStep,
          currentPosition: currentPosition,
        ),
      ),
    );
  }
}

class AudioWaveformPainter extends CustomPainter {
  final Waveform waveform;
  final Duration start;
  final Duration duration;
  final Color waveColor;
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Duration currentPosition;
  final Paint wavePaint;

  AudioWaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    this.waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
    required this.currentPosition,
  }) : wavePaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..color = waveColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (duration == Duration.zero) return;

    double width = size.width;
    double height = size.height;

    final waveformPixelsPerWindow = waveform.positionToPixel(duration).toInt();
    final waveformPixelsPerDevicePixel = waveformPixelsPerWindow / width;
    final waveformPixelsPerStep = waveformPixelsPerDevicePixel * pixelsPerStep;
    final sampleOffset = waveform.positionToPixel(start);
    final sampleStart = -sampleOffset % waveformPixelsPerStep;
    for (var i = sampleStart.toDouble();
        i <= waveformPixelsPerWindow + 1.0;
        i += waveformPixelsPerStep) {
      final sampleIdx = (sampleOffset + i).toInt();
      final x = i / waveformPixelsPerDevicePixel;
      final minY = normalise(waveform.getPixelMin(sampleIdx), height);
      final maxY = normalise(waveform.getPixelMax(sampleIdx), height);
      canvas.drawLine(
        Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
        Offset(x + strokeWidth / 2, min(height - strokeWidth * 0.75, maxY)),
        wavePaint,
      );
    }

    final playPosition = currentPosition - start;
    if (playPosition >= Duration.zero && playPosition <= duration) {
      final playX =
          playPosition.inMilliseconds / duration.inMilliseconds * width;
      final playPaint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;
      canvas.drawLine(
        Offset(playX, 0),
        Offset(playX, height),
        playPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition ||
        oldDelegate.start != start ||
        oldDelegate.duration != duration;
  }

  double normalise(int s, double height) {
    if (waveform.flags == 0) {
      final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
      return height - 1 - y * height / 65536;
    } else {
      final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
      return height - 1 - y * height / 256;
    }
  }
}
