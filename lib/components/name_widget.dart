import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'name_model.dart';
export 'name_model.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final int? parameter1;
  final String? parameter2;

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late NameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameModel());

    _model.textController ??= TextEditingController();
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onFieldSubmitted: (_) async {
          FFAppState().updateRecordlistAtIndex(
            widget.parameter1!,
            (e) => e..name = _model.textController.text,
          );
          setState(() {});
          FFAppState().updateRecordlistAtIndex(
            widget.parameter1!,
            (e) => e..nameedit = false,
          );
          setState(() {});
        },
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: FFLocalizations.of(context).getText(
            'kwfsqgb1' /* Enter a new name.. */,
          ),
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Manrope',
                fontSize: 13.0,
                letterSpacing: 0.0,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
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
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              letterSpacing: 0.0,
            ),
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
