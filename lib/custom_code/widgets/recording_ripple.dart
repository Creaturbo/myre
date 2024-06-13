// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ripple_wave/ripple_wave.dart'; // Import the ripple_wave package

class RecordingRipple extends StatefulWidget {
  const RecordingRipple({
    super.key,
    this.width,
    this.height,
    this.repeat = true,
    this.rippleColor = Colors.blue,
    this.elevation = 4.0,
    this.borderRadius = 100.0,
    this.borderColor,
    this.borderWidth = 5.0,
    this.iconColor,
    this.iconSize = 50.0,
  });

  final double? width;
  final double? height;
  final bool repeat;
  final Color rippleColor;
  final double elevation;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final Color? iconColor;
  final double iconSize;

  @override
  State<RecordingRipple> createState() => _RecordingRippleState();
}

class _RecordingRippleState extends State<RecordingRipple> {
  @override
  Widget build(BuildContext context) {
    return RippleWave(
      repeat: widget.repeat,
      color: widget.rippleColor,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Material(
          color: Colors.transparent,
          elevation: widget.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Container(
            width: widget.width ?? 100.0,
            height: widget.height ?? 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color:
                    widget.borderColor ?? FlutterFlowTheme.of(context).tertiary,
                width: widget.borderWidth,
              ),
            ),
            child: Icon(
              Icons.mic_off,
              color: widget.iconColor ??
                  FlutterFlowTheme.of(context).primaryBackground,
              size: widget.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
