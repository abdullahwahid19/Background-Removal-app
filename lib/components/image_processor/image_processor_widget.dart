import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_processor_model.dart';
export 'image_processor_model.dart';

class ImageProcessorWidget extends StatefulWidget {
  const ImageProcessorWidget({Key? key}) : super(key: key);

  @override
  _ImageProcessorWidgetState createState() => _ImageProcessorWidgetState();
}

class _ImageProcessorWidgetState extends State<ImageProcessorWidget> {
  late ImageProcessorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageProcessorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Text(
              'Image Editor',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Montserrat',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 32.0, 0.0),
                      child: Text(
                        'Image',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          _model.uploadedFileUrl1 != null &&
                                  _model.uploadedFileUrl1 != ''
                              ? _model.uploadedFileUrl1
                              : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                          width: 150.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isMediaUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isMediaUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload media');
                                  return;
                                }
                              }
                            },
                            child: Text(
                              _model.uploadedFileUrl1 != null &&
                                      _model.uploadedFileUrl1 != ''
                                  ? 'Edit Image'
                                  : 'Upload Image',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 32.0, 0.0),
                      child: Text(
                        'Background',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 32.0),
                          child: Container(
                            width: 400.0,
                            decoration: BoxDecoration(),
                            child: FlutterFlowRadioButton(
                              options: ['Color', 'Image', 'None'].toList(),
                              onChanged: (val) =>
                                  setState(() => _model.radioButtonValue = val),
                              optionHeight: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 20.0,
                                  ),
                              selectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).white,
                                    fontSize: 20.0,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).white,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.spaceEvenly,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ),
                        if (_model.radioButtonValue == 'Color')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                constraints: BoxConstraints(
                                  maxWidth: 100.0,
                                  maxHeight: 100.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _model.colorPicked,
                                      borderRadius: BorderRadius.circular(50.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    final _colorPickedColor =
                                        await showFFColorPicker(
                                      context,
                                      currentColor: _model.colorPicked ??=
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      showRecentColors: true,
                                      allowOpacity: true,
                                      textColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      secondaryTextColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      primaryButtonBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      primaryButtonTextColor: Colors.white,
                                      primaryButtonBorderColor:
                                          Colors.transparent,
                                      displayAsBottomSheet:
                                          isMobileWidth(context),
                                    );

                                    if (_colorPickedColor != null) {
                                      setState(() => _model.colorPicked =
                                          _colorPickedColor);
                                    }
                                  },
                                  child: Text(
                                    _model.colorPicked != null
                                        ? 'Edit Color'
                                        : 'Select Color',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14.0,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (_model.radioButtonValue == 'Image')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                _model.uploadedFileUrl2 != null &&
                                        _model.uploadedFileUrl2 != ''
                                    ? _model.uploadedFileUrl2
                                    : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                width: 150.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                          _model.isMediaUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isMediaUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Text(
                                    _model.uploadedFileUrl2 != null &&
                                            _model.uploadedFileUrl2 != ''
                                        ? 'Edit Image'
                                        : 'Upload Image',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14.0,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.radioButtonValue == 'None') {
                            _model.apiImage = await actions.api2Firebase(
                              _model.uploadedFileUrl1,
                              FFAppState().nullStr,
                              FFAppState().nullStr,
                              random_data.randomString(
                                10,
                                10,
                                true,
                                true,
                                true,
                              ),
                            );
                            if (_model.apiImage != null &&
                                _model.apiImage != '') {
                              setState(() {
                                FFAppState().apiResult = _model.apiImage!;
                              });

                              final usersUpdateData1 = {
                                'myDesigns': FieldValue.arrayUnion([
                                  getOldEditsFirestoreData(
                                    createOldEditsStruct(
                                      date: getCurrentTimestamp,
                                      image: _model.apiImage,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              };
                              await currentUserReference!
                                  .update(usersUpdateData1);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'PASS',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );

                              context.pushNamed(
                                'ImageEditor',
                                queryParams: {
                                  'ogImg': serializeParam(
                                    _model.uploadedFileUrl1,
                                    ParamType.String,
                                  ),
                                  'resImg': serializeParam(
                                    FFAppState().apiResult,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'FAIL',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            }
                          } else {
                            if (_model.radioButtonValue == 'Color') {
                              _model.apiImageColor = await actions.api2Firebase(
                                _model.uploadedFileUrl1,
                                functions.color2String(_model.colorPicked!),
                                FFAppState().nullStr,
                                random_data.randomString(
                                  10,
                                  10,
                                  true,
                                  true,
                                  true,
                                ),
                              );
                              if (_model.apiImageColor != null &&
                                  _model.apiImageColor != '') {
                                setState(() {
                                  FFAppState().apiResult =
                                      _model.apiImageColor!;
                                });

                                final usersUpdateData2 = {
                                  'myDesigns': FieldValue.arrayUnion([
                                    getOldEditsFirestoreData(
                                      createOldEditsStruct(
                                        date: getCurrentTimestamp,
                                        image: _model.apiImageColor,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                };
                                await currentUserReference!
                                    .update(usersUpdateData2);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'PASS',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );

                                context.pushNamed(
                                  'ImageEditor',
                                  queryParams: {
                                    'ogImg': serializeParam(
                                      _model.uploadedFileUrl1,
                                      ParamType.String,
                                    ),
                                    'resImg': serializeParam(
                                      _model.apiImageColor,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'FAIL',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              }
                            } else {
                              _model.apiImageBg = await actions.api2Firebase(
                                _model.uploadedFileUrl1,
                                FFAppState().nullStr,
                                _model.uploadedFileUrl2,
                                random_data.randomString(
                                  10,
                                  10,
                                  true,
                                  true,
                                  true,
                                ),
                              );
                              if (_model.apiImageBg != null &&
                                  _model.apiImageBg != '') {
                                setState(() {
                                  FFAppState().apiResult = _model.apiImageBg!;
                                });

                                final usersUpdateData3 = {
                                  'myDesigns': FieldValue.arrayUnion([
                                    getOldEditsFirestoreData(
                                      createOldEditsStruct(
                                        date: getCurrentTimestamp,
                                        image: _model.apiImageBg,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                };
                                await currentUserReference!
                                    .update(usersUpdateData3);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'PASS',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );

                                context.pushNamed(
                                  'ImageEditor',
                                  queryParams: {
                                    'ogImg': serializeParam(
                                      _model.uploadedFileUrl1,
                                      ParamType.String,
                                    ),
                                    'resImg': serializeParam(
                                      _model.apiImageBg,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'FAIL',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor: Color(0x00000000),
                                  ),
                                );
                              }
                            }
                          }

                          setState(() {});
                        },
                        text: 'Process Image',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 80.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.testImg = await actions.watermarkImg(
                            'https://firebasestorage.googleapis.com/v0/b/car-extractor.appspot.com/o/users%2FATNF5cTtinfH3Xzm3eukkMcsktN2%2F6fjPnw8fA0.png?alt=media&token=a29a68fd-dcaf-4a4f-bdab-9e9510433198',
                            'https://firebasestorage.googleapis.com/v0/b/car-extractor.appspot.com/o/users%2FATNF5cTtinfH3Xzm3eukkMcsktN2%2Ftwt%20logo.png?alt=media&token=947dd402-58d7-47f6-90a1-0b558431919c',
                          );

                          setState(() {});
                        },
                        text: 'Test ',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 30.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Image.network(
                      _model.testImg != null && _model.testImg != ''
                          ? _model.testImg!
                          : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
