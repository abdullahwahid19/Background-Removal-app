import '/components/contact/contact_widget.dart';
import '/components/features/features_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/image_intro/image_intro_widget.dart';
import '/components/intro/intro_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/page_slider/page_slider_widget.dart';
import '/components/pricing/pricing_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => setState(() {}),
                    child: NavbarWidget(),
                  ),
                  wrapWithModel(
                    model: _model.introModel,
                    updateCallback: () => setState(() {}),
                    child: IntroWidget(),
                  ),
                  wrapWithModel(
                    model: _model.imageIntroModel,
                    updateCallback: () => setState(() {}),
                    child: ImageIntroWidget(),
                  ),
                  wrapWithModel(
                    model: _model.featuresModel,
                    updateCallback: () => setState(() {}),
                    child: FeaturesWidget(),
                  ),
                  wrapWithModel(
                    model: _model.pageSliderModel,
                    updateCallback: () => setState(() {}),
                    child: PageSliderWidget(),
                  ),
                  wrapWithModel(
                    model: _model.pricingModel,
                    updateCallback: () => setState(() {}),
                    child: PricingWidget(),
                  ),
                  wrapWithModel(
                    model: _model.contactModel,
                    updateCallback: () => setState(() {}),
                    child: ContactWidget(),
                  ),
                  wrapWithModel(
                    model: _model.footerModel,
                    updateCallback: () => setState(() {}),
                    child: FooterWidget(),
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
