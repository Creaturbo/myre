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

class CustomAudioPlayer extends StatefulWidget {
  const CustomAudioPlayer({
    super.key,
    this.width,
    this.height,
    required this.audioUrl,
  });

  final double? width;
  final double? height;
  final String audioUrl;

  @override
  State<CustomAudioPlayer> createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    if (widget.audioUrl.isNotEmpty) {
      _audioPlayer.setUrl(widget.audioUrl).catchError((error) {
        print('An error occurred while loading the audio: $error');
      });
    } else {
      print('Audio URL is empty.');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      _audioPlayer.play();
    } else {
      _audioPlayer.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50,
      child: IconButton(
        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
        iconSize: 24,
        onPressed: _togglePlayPause,
      ),
    );
  }
}
