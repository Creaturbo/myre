import '/flutter_flow/flutter_flow_util.dart';
import 'meeting_details_widget.dart' show MeetingDetailsWidget;
import 'package:flutter/material.dart';

class MeetingDetailsModel extends FlutterFlowModel<MeetingDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioTextController;
  String? Function(BuildContext, String?)? shortBioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortBioFocusNode?.dispose();
    shortBioTextController?.dispose();
  }
}
