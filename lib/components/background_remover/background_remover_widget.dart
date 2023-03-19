import '../../custom_code/actions/img2firebase.dart';
import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_media.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'background_remover_model.dart';
import '/pages/dashboard/dashboard_widget.dart';
export 'background_remover_model.dart';

class BackgroundRemoverWidget extends StatefulWidget {
  const BackgroundRemoverWidget({Key? key}) : super(key: key);

  @override
  _BackgroundRemoverWidgetState createState() =>
      _BackgroundRemoverWidgetState();
}

class _BackgroundRemoverWidgetState extends State<BackgroundRemoverWidget> {
  late BackgroundRemoverModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackgroundRemoverModel());

    _model.textController ??= TextEditingController();
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

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        Container(
                          child: _model.uploadedLocalFile1.name != null
                              ? Image.memory(
                                  _model.uploadedLocalFile1.bytes!,
                                  fit: BoxFit.contain,
                                )
                              : Image.network(
                                  'https://archive.org/download/no-photo-available/no-photo-available.png',
                                  fit: BoxFit.cover),
                          width: 150.0,
                          height: 100.0,
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

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isMediaUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }
                            },
                            child: Text(
                              _model.uploadedLocalFile1.name != null
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
                              onChanged: (val) => setState(() {}),
                              controller: _model.radioButtonController1 ??=
                                  FormFieldController<String>('None'),
                              optionHeight: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.horizontal,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              toggleable: false,
                              horizontalAlignment: WrapAlignment.spaceAround,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                        ),
                        if (_model.radioButtonValue1 == 'Color')
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 14.0,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (_model.radioButtonValue1 == 'Image')
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: _model.uploadedLocalFile2.name != null
                                    ? Image.memory(
                                        _model.uploadedLocalFile2.bytes!,
                                        fit: BoxFit.contain,
                                      )
                                    : Image.network(
                                        'https://archive.org/download/no-photo-available/no-photo-available.png',
                                        fit: BoxFit.cover),
                                width: 150.0,
                                height: 100.0,
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
                                      } finally {
                                        _model.isMediaUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Text(
                                    _model.uploadedLocalFile2.name != null
                                        ? 'Edit Image'
                                        : 'Upload Image',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
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
                          if (_model.radioButtonValue1 == 'None') {
                            _model.apiImage = await actions.api2Firebase(
                              _model.uploadedLocalFile1.bytes!,
                              '',
                              null,
                            );
                            setState(() {
                              FFAppState().bgRemResult = _model.apiImage!;
                              FFAppState().logoAdded = true;
                              FFAppState().imgLogoBytes =
                                  FFAppState().bgRemResult;
                            });
                            setState(() {});
                          } else {
                            if (_model.radioButtonValue1 == 'Color') {
                              _model.apiImageColor = await actions.api2Firebase(
                                _model.uploadedLocalFile1.bytes!,
                                functions.color2String(_model.colorPicked!),
                                null,
                              );
                              setState(() {
                                FFAppState().bgRemResult =
                                    _model.apiImageColor!;
                                FFAppState().logoAdded = true;
                                FFAppState().imgLogoBytes =
                                    FFAppState().bgRemResult;
                              });
                            } else {
                              _model.apiImageBg = await actions.api2Firebase(
                                _model.uploadedLocalFile1.bytes!,
                                '',
                                _model.uploadedLocalFile2.bytes!,
                              );
                              setState(() {
                                FFAppState().bgRemResult = _model.apiImageBg!;
                                FFAppState().logoAdded = true;
                                FFAppState().imgLogoBytes =
                                    FFAppState().bgRemResult;
                              });
                            }
                          }
                        },
                        text: 'Remove Background',
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
                  ],
                ),
              ],
            ),
          ),
          if (FFAppState().bgRemResult.length != 0)
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 32.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Edited Image',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Container(
                                            child: FFAppState()
                                                        .bgRemResult
                                                        .length !=
                                                    0
                                                ? Image.memory(
                                                    FFAppState().bgRemResult,
                                                    fit: BoxFit.contain,
                                                  )
                                                : Image.network(
                                                    'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                    fit: BoxFit.cover),
                                          ),
                                          allowRotation: false,
                                          tag: FFAppState().bgRemResult !=
                                                  Uint8List(0)
                                              ? FFAppState().bgRemResult
                                              : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: FFAppState().bgRemResult.length != 0
                                        ? FFAppState().bgRemResult
                                        : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                    transitionOnUserGestures: true,
                                    child: Container(
                                      child: FFAppState().bgRemResult.length !=
                                              0
                                          ? Image.memory(
                                              FFAppState().bgRemResult,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              'https://archive.org/download/no-photo-available/no-photo-available.png',
                                              fit: BoxFit.contain),
                                      width: 1100,
                                      height: 700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Orignal Image',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Container(
                                          child: _model.uploadedLocalFile1
                                                      .name !=
                                                  null
                                              ? Image.memory(
                                                  _model.uploadedLocalFile1
                                                      .bytes!,
                                                  fit: BoxFit.contain,
                                                )
                                              : Image.network(
                                                  'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                  fit: BoxFit.cover),
                                        ),
                                        allowRotation: false,
                                        tag: _model.uploadedLocalFile1.name !=
                                                null
                                            ? 'localFile1'
                                            : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: _model.uploadedLocalFile1.name != null
                                      ? 'localFile1'
                                      : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    child: _model.uploadedLocalFile1.name !=
                                            null
                                        ? Image.memory(
                                            _model.uploadedLocalFile1.bytes!,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://archive.org/download/no-photo-available/no-photo-available.png',
                                            fit: BoxFit.cover),
                                    width: 250.0,
                                    height: 175.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 128.0, 0.0, 0.0),
                                    child: Text('Swipe to Add Logo',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await actions.imageDownloader(
                                          FFAppState().bgRemResult,
                                        );
                                      },
                                      text: 'Download Result',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 70.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final imgStr = await img2firebase(
                                            FFAppState().bgRemResult,
                                            random_data.randomString(
                                                10, 10, true, true, true));
                                        final usersUpdateData = {
                                          'myDesigns': FieldValue.arrayUnion([
                                            getOldEditsFirestoreData(
                                              createOldEditsStruct(
                                                date: getCurrentTimestamp,
                                                image: imgStr,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        setState(() {
                                          FFAppState().bgRemResult =
                                              Uint8List(0);
                                        });
                                        setState(() {
                                          FFAppState().logoAddResult =
                                              Uint8List(0);
                                        });
                                        context.pushNamed('Dashboard');
                                      },
                                      text: 'Save and Reset',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 70.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().bgRemResult =
                                              Uint8List(0);
                                        });
                                        setState(() {
                                          FFAppState().logoAddResult =
                                              Uint8List(0);
                                        });
                                        context.pushNamed('Dashboard');
                                      },
                                      child: Text(
                                        'Reset',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
