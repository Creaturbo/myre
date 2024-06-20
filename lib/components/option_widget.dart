import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'option_model.dart';
export 'option_model.dart';

class OptionWidget extends StatefulWidget {
  const OptionWidget({super.key});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  late OptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionModel());

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

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'd9ca8i6y' /* Setting */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Urbanist',
                                letterSpacing: 0.0,
                              ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: FlutterFlowLanguageSelector(
                              width: 160.0,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              dropdownIconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 8.0,
                              textStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                              ),
                              hideFlags: true,
                              flagSize: 24.0,
                              flagTextGap: 8.0,
                              currentLanguage:
                                  FFLocalizations.of(context).languageCode,
                              languages: FFLocalizations.languages(),
                              onChanged: (lang) =>
                                  setAppLanguage(context, lang),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'i00u8fua' /* Automatic continuous recording */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.95, -0.96),
                            child: FlutterFlowDropDown<bool>(
                              controller: _model.dropDownValueController1 ??=
                                  FormFieldController<bool>(
                                _model.dropDownValue1 ??=
                                    FFAppState().Signalfactor,
                              ),
                              options: List<bool>.from([true, false]),
                              optionLabels: [
                                FFLocalizations.of(context).getText(
                                  'rdz7lhoo' /* On */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'kfucbpeh' /* Off */,
                                )
                              ],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue1 = val);
                                if (_model.dropDownValue1 == true) {
                                  FFAppState().Signalfactor = true;
                                  setState(() {});
                                } else {
                                  FFAppState().Signalfactor = false;
                                  setState(() {});
                                }
                              },
                              width: 100.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'gc3huf1i' /* On/Off */,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'y1w8c7dt' /* Automatic deletion interval (h... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.95, -0.96),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue2 ??=
                                    valueOrDefault<String>(
                                  FFAppState().deletetime,
                                  '1',
                                ),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'tak53osr' /* 1 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '15iehxb1' /* 2 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'zfc0vpyr' /* 3 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'q6gl5ziv' /* 4 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '12w50g3d' /* 5 */,
                                )
                              ],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue2 = val);
                                FFAppState().deletetime =
                                    _model.dropDownValue2!;
                                setState(() {});
                                _model.settime =
                                    await actions.convertHoursToMilliseconds(
                                  FFAppState().deletetime,
                                );
                                FFAppState().settime = _model.settime!;
                                setState(() {});

                                setState(() {});
                              },
                              width: 100.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'g4quft4q' /* Hours */,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vwe63w5m' /* Automatic recording interval (... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.95, -0.96),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController3 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue3 ??= FFAppState().savetime,
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  '95we028i' /* 15 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '82smr6hn' /* 30 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '9law8jq7' /* 60 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '1wjklzqv' /* 90 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'saj755dh' /* 120 */,
                                )
                              ],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue3 = val);
                                FFAppState().savetime = _model.dropDownValue3!;
                                setState(() {});
                                _model.savesettime =
                                    await actions.convertMinutesToMilliseconds(
                                  FFAppState().savetime,
                                );
                                FFAppState().savesettime = _model.savesettime!;
                                setState(() {});

                                setState(() {});
                              },
                              width: 100.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'ayvcpw0c' /* Minutes */,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
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
          Align(
            alignment: const AlignmentDirectional(0.0, 0.99),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: FFLocalizations.of(context).getText(
                  'f55qxrnl' /* Close */,
                ),
                options: FFButtonOptions(
                  width: 150.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
