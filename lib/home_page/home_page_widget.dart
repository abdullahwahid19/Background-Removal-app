import '/components/contact_widget.dart';
import '/components/features_widget.dart';
import '/components/footer_widget.dart';
import '/components/image_intro_widget.dart';
import '/components/intro_widget.dart';
import '/components/navbar_widget.dart';
import '/components/page_slider_widget.dart';
import '/components/pricing_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'introOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
                  ).animateOnActionTrigger(
                    animationsMap['introOnActionTriggerAnimation']!,
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
