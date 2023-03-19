import 'package:carcutter/flutter_flow/random_data_util.dart';

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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'logo_adder_model.dart';
import 'package:screenshot/screenshot.dart';
export 'logo_adder_model.dart';

class LogoAdderWidget extends StatefulWidget {
  const LogoAdderWidget({Key? key}) : super(key: key);

  @override
  _LogoAdderWidgetState createState() => _LogoAdderWidgetState();
}

class _LogoAdderWidgetState extends State<LogoAdderWidget> {
  late LogoAdderModel _model;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoAdderModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController(text: '50');
    FFUploadedFile imgLogoBytes = FFUploadedFile(
        name: FFAppState().imgLogoBytesName, bytes: FFAppState().imgLogoBytes);
    setState(() {
      _model.uploadedLocalFile1 = imgLogoBytes;
    });
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
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 32.0, 0.0),
                          child: Text(
                            'Image',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                              child: FFAppState().imgLogoBytes.length != 0
                                  ? Image.memory(
                                      FFAppState().imgLogoBytes,
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
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isMediaUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
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
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isMediaUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        FFAppState().imgLogoBytes =
                                            _model.uploadedLocalFile1.bytes!;
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
                                  FFAppState().imgLogoBytes.length != 0
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
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 32.0, 0.0),
                          child: Text(
                            'Logo',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 267.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FlutterFlowRadioButton(
                                  options: ['Image', 'Text'].toList(),
                                  onChanged: (val) => setState(() {
                                    FFAppState().imgLogo =
                                        !(FFAppState().imgLogo);
                                  }),
                                  controller: _model.radioButtonController ??=
                                      FormFieldController<String>('Image'),
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
                                  horizontalAlignment:
                                      WrapAlignment.spaceAround,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ),
                              if (_model.radioButtonValue == 'Image')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 32.0, 32.0, 32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              child: _model.uploadedLocalFile2
                                                          .name !=
                                                      null
                                                  ? Image.memory(
                                                      _model.uploadedLocalFile2
                                                          .bytes!,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Image.network(
                                                      'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                      fit: BoxFit.cover),
                                              width: 150.0,
                                              height: 100.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
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
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isMediaUploading2 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      _model.isMediaUploading2 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile2 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      setState(() {});
                                                      showUploadMessage(context,
                                                          'Failed to upload media');
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  _model.uploadedLocalFile2
                                                              .name !=
                                                          null
                                                      ? 'Edit Image'
                                                      : 'Upload Image',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontSize: 16.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
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
                              if (_model.radioButtonValue == 'Text')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 32.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller: _model.textController1,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Logo Text',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 20.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                          maxLines: null,
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 32.0, 16.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().logoImgPos = [-1, -1];
                            FFAppState().logoAddResult =
                                _model.uploadedLocalFile1.bytes!;
                          });
                        },
                        text: 'Add Logo',
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
          if (FFAppState().logoAddResult.length != 0)
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
                                            alignment: Alignment.center,
                                            child: FFAppState()
                                                        .logoAddResult
                                                        .length !=
                                                    0
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    child: Stack(
                                                      children: [
                                                        Image.memory(
                                                            FFAppState()
                                                                .imgLogoBytes,
                                                            fit:
                                                                BoxFit.contain),
                                                        Align(
                                                          alignment: Alignment(
                                                              FFAppState()
                                                                      .logoImgPos[
                                                                  0],
                                                              FFAppState()
                                                                  .logoImgPos[1]),
                                                          child: FFAppState()
                                                                  .imgLogo
                                                              ? Image.memory(
                                                                  _model
                                                                      .uploadedLocalFile2
                                                                      .bytes!,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  width: 100,
                                                                  height: 100,
                                                                )
                                                              : Text(_model
                                                                  .textController1
                                                                  .text),
                                                        ),
                                                      ],
                                                    ),
                                                    width: 1100,
                                                    height: 700,
                                                  )
                                                : Image.network(
                                                    'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                    fit: BoxFit.cover),
                                          ),
                                          allowRotation: false,
                                          tag: FFAppState()
                                                      .logoAddResult
                                                      .length !=
                                                  0
                                              ? FFAppState().logoAddResult
                                              : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: FFAppState().logoAddResult.length != 0
                                        ? 'logoAddResultFile'
                                        : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                    transitionOnUserGestures: true,
                                    child: Container(
                                      child: FFAppState()
                                                  .logoAddResult
                                                  .length !=
                                              0
                                          ? Screenshot(
                                              controller: screenshotController,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  children: [
                                                    Image.memory(
                                                        FFAppState()
                                                            .imgLogoBytes,
                                                        fit: BoxFit.contain),
                                                    Align(
                                                      alignment: Alignment(
                                                          FFAppState()
                                                              .logoImgPos[0],
                                                          FFAppState()
                                                              .logoImgPos[1]),
                                                      child: FFAppState()
                                                              .imgLogo
                                                          ? Image.memory(
                                                              _model
                                                                  .uploadedLocalFile2
                                                                  .bytes!,
                                                              fit: BoxFit
                                                                  .contain,
                                                              width: 100,
                                                              height: 100,
                                                            )
                                                          : Text(_model
                                                              .textController1
                                                              .text),
                                                    ),
                                                  ],
                                                ),
                                                width: 1100,
                                                height: 700,
                                              ))
                                          : Image.network(
                                              'https://archive.org/download/no-photo-available/no-photo-available.png',
                                              fit: BoxFit.cover),
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
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Orignal Image',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                          child: FFAppState()
                                                      .logoAddResult
                                                      .length !=
                                                  0
                                              ? Image.memory(
                                                  FFAppState().logoAddResult,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                  fit: BoxFit.cover),
                                        ),
                                        allowRotation: false,
                                        tag: FFAppState()
                                                    .logoAddResult
                                                    .length !=
                                                0
                                            ? FFAppState().logoAddResult
                                            : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: FFAppState().logoAddResult.length != 0
                                      ? FFAppState().logoAddResult
                                      : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    child: FFAppState().logoAddResult.length !=
                                            0
                                        ? Image.memory(
                                            FFAppState().logoAddResult,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://archive.org/download/no-photo-available/no-photo-available.png',
                                            fit: BoxFit.cover),
                                    height: 200,
                                    width: 300,
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Move Logo',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    FFAppState().logoImgPos[
                                                        0] = FFAppState()
                                                            .logoImgPos[0] -
                                                        (int.parse(_model
                                                                .textController2
                                                                .text) /
                                                            1000);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.arrow_left,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 48.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        FFAppState().logoImgPos[
                                                            1] = FFAppState()
                                                                .logoImgPos[1] -
                                                            (int.parse(_model
                                                                    .textController2
                                                                    .text) /
                                                                1000);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_drop_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 48.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 50.0,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: 48.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController2,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 16.0,
                                                              ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .textController2Validator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                                RegExp('[0-9]'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      setState(() {
                                                        FFAppState().logoImgPos[
                                                            1] = FFAppState()
                                                                .logoImgPos[1] +
                                                            (int.parse(_model
                                                                    .textController2
                                                                    .text) /
                                                                1000);
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_drop_down,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 48.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().logoImgPos[0] =
                                                  FFAppState().logoImgPos[0] +
                                                      (int.parse(_model
                                                              .textController2
                                                              .text) /
                                                          1000);
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 48.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        Uint8List? logoAddedImg =
                                            await screenshotController
                                                .capture();
                                        print('screenshot captured');
                                        await actions
                                            .imageDownloader(logoAddedImg);
                                      },
                                      text: 'Download Image',
                                      options: FFButtonOptions(
                                        width: 250.0,
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
                                            randomString(
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
                                          FFAppState().logoAddResult =
                                              Uint8List(0);
                                        });
                                        context.pushNamed('Dashboard');
                                      },
                                      text: 'Save and Reset',
                                      options: FFButtonOptions(
                                        width: 250.0,
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
