import '/components/footer/footer_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_editor_model.dart';
export 'image_editor_model.dart';

class ImageEditorWidget extends StatefulWidget {
  const ImageEditorWidget({
    Key? key,
    this.ogImg,
    this.resImg,
  }) : super(key: key);

  final String? ogImg;
  final String? resImg;

  @override
  _ImageEditorWidgetState createState() => _ImageEditorWidgetState();
}

class _ImageEditorWidgetState extends State<ImageEditorWidget> {
  late ImageEditorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageEditorModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.wImg = await actions.watermarkImg(
        widget.resImg!,
        'https://firebasestorage.googleapis.com/v0/b/car-extractor.appspot.com/o/users%2FATNF5cTtinfH3Xzm3eukkMcsktN2%2Ftwt%20logo.png?alt=media&token=947dd402-58d7-47f6-90a1-0b558431919c',
        'Top Right',
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(64.0, 0.0, 64.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => setState(() {}),
                    child: NavbarWidget(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                      child: Image.network(
                                        _model.wImg != null && _model.wImg != ''
                                            ? _model.wImg!
                                            : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                        width: 1100.0,
                                        height: 700.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 0.0, 32.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Logo Position',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  initialOption:
                                                      _model.dropDownValue ??=
                                                          'Top Right',
                                                  options: [
                                                    'Top Right',
                                                    'Top Left',
                                                    'Bottom Right',
                                                    'Bottom Left'
                                                  ],
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                        .dropDownValue = val);
                                                    await actions.watermarkImg(
                                                      widget.ogImg!,
                                                      'https://firebasestorage.googleapis.com/v0/b/car-extractor.appspot.com/o/users%2FATNF5cTtinfH3Xzm3eukkMcsktN2%2Ftwt%20logo.png?alt=media&token=947dd402-58d7-47f6-90a1-0b558431919c',
                                                      _model.dropDownValue!,
                                                    );
                                                  },
                                                  width: 300.0,
                                                  height: 70.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      ),
                                                  hintText: 'Please Select',
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  borderWidth: 1.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await actions.imageDownloader(
                                                  FFAppState().apiResult,
                                                );
                                              },
                                              text: 'Download Image',
                                              options: FFButtonOptions(
                                                width: 250.0,
                                                height: 70.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
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
                                        ],
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
                                    child: Image.network(
                                      widget.ogImg != null && widget.ogImg != ''
                                          ? widget.ogImg!
                                          : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                      width: 250.0,
                                      height: 175.0,
                                      fit: BoxFit.cover,
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.footerModel,
                      updateCallback: () => setState(() {}),
                      child: FooterWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
