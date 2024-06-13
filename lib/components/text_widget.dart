import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_model.dart';
export 'text_model.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
    required this.parameter1,
  });

  final String? parameter1;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  late TextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.parameter1,
      'name',
    ));
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 50.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Manrope',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
            textAlign: TextAlign.start,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
