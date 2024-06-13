import '/flutter_flow/flutter_flow_util.dart';
import 'text_widget.dart' show TextWidget;
import 'package:flutter/material.dart';

class TextModel extends FlutterFlowModel<TextWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
