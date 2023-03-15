import '/components/footer/footer_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'logo_add_model.dart';
export 'logo_add_model.dart';

class LogoAddWidget extends StatefulWidget {
  const LogoAddWidget({
    Key? key,
    this.ogImg,
    this.resImg,
    this.imgbytes,
    this.logobytes,
  }) : super(key: key);

  final String? ogImg;
  final String? resImg;
  final dynamic imgbytes;
  final dynamic logobytes;

  @override
  _LogoAddWidgetState createState() => _LogoAddWidgetState();
}

class _LogoAddWidgetState extends State<LogoAddWidget> {
  late LogoAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoAddModel());

    _model.textController ??= TextEditingController(text: '50');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: Image.network(
                                                  widget.resImg != null &&
                                                          widget.resImg != ''
                                                      ? widget.resImg!
                                                      : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: widget.resImg != null &&
                                                        widget.resImg != ''
                                                    ? widget.resImg!
                                                    : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: widget.resImg != null &&
                                                  widget.resImg != ''
                                              ? widget.resImg!
                                              : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                          transitionOnUserGestures: true,
                                          child: Image.network(
                                            widget.resImg != null &&
                                                    widget.resImg != ''
                                                ? widget.resImg!
                                                : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                            width: 1100.0,
                                            height: 700.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
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
                                                'Move Logo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          _model.waterOutL =
                                                              await actions
                                                                  .watermarkImg(
                                                            widget.imgbytes!,
                                                            widget.logobytes!,
                                                            'previous value',
                                                            random_data
                                                                .randomString(
                                                              10,
                                                              10,
                                                              true,
                                                              true,
                                                              true,
                                                            ),
                                                          );

                                                          context.pushNamed(
                                                            'LogoAdd',
                                                            queryParams: {
                                                              'ogImg':
                                                                  serializeParam(
                                                                _model.waterOutL
                                                                    ?.first,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'resImg':
                                                                  serializeParam(
                                                                _model.waterOutL
                                                                    ?.last,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.arrow_left,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .white,
                                                          size: 48.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              _model.waterOut =
                                                                  await actions
                                                                      .watermarkImg(
                                                                widget
                                                                    .imgbytes!,
                                                                widget
                                                                    .logobytes!,
                                                                'previous value',
                                                                random_data
                                                                    .randomString(
                                                                  10,
                                                                  10,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                              );

                                                              context.pushNamed(
                                                                'LogoAdd',
                                                                queryParams: {
                                                                  'ogImg':
                                                                      serializeParam(
                                                                    _model
                                                                        .waterOutR
                                                                        ?.first,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'resImg':
                                                                      serializeParam(
                                                                    _model
                                                                        .waterOutR
                                                                        ?.last,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_up,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .white,
                                                              size: 48.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 50.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Container(
                                                            width: 48.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .textControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '[0-9]'))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              _model.waterOutD =
                                                                  await actions
                                                                      .watermarkImg(
                                                                widget
                                                                    .imgbytes!,
                                                                widget
                                                                    .logobytes!,
                                                                'previous value',
                                                                random_data
                                                                    .randomString(
                                                                  10,
                                                                  10,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                              );

                                                              context.pushNamed(
                                                                'LogoAdd',
                                                                queryParams: {
                                                                  'ogImg':
                                                                      serializeParam(
                                                                    _model
                                                                        .waterOutD
                                                                        ?.first,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'resImg':
                                                                      serializeParam(
                                                                    _model
                                                                        .waterOutD
                                                                        ?.last,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .white,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    _model.waterOutR =
                                                        await actions
                                                            .watermarkImg(
                                                      widget.imgbytes!,
                                                      widget.logobytes!,
                                                      'previous value',
                                                      random_data.randomString(
                                                        10,
                                                        10,
                                                        true,
                                                        true,
                                                        true,
                                                      ),
                                                    );

                                                    context.pushNamed(
                                                      'LogoAdd',
                                                      queryParams: {
                                                        'ogImg': serializeParam(
                                                          _model
                                                              .waterOutR?.first,
                                                          ParamType.String,
                                                        ),
                                                        'resImg':
                                                            serializeParam(
                                                          _model
                                                              .waterOutR?.last,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .white,
                                                    size: 48.0,
                                                  ),
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
                                                  widget.resImg,
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
                                          InkWell(
                                            onTap: () async {
                                              context.pushNamed('Dashboard');
                                            },
                                            child: Text(
                                              'Back To Home',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 16.0,
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
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                widget.ogImg != null &&
                                                        widget.ogImg != ''
                                                    ? widget.ogImg!
                                                    : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: widget.ogImg != null &&
                                                      widget.ogImg != ''
                                                  ? widget.ogImg!
                                                  : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: widget.ogImg != null &&
                                                widget.ogImg != ''
                                            ? widget.ogImg!
                                            : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                        transitionOnUserGestures: true,
                                        child: Image.network(
                                          widget.ogImg != null &&
                                                  widget.ogImg != ''
                                              ? widget.ogImg!
                                              : 'https://archive.org/download/no-photo-available/no-photo-available.png',
                                          width: 250.0,
                                          height: 175.0,
                                          fit: BoxFit.contain,
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
