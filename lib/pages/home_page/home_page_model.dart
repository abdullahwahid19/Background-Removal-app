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

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for Intro component.
  late IntroModel introModel;
  // Model for ImageIntro component.
  late ImageIntroModel imageIntroModel;
  // Model for Features component.
  late FeaturesModel featuresModel;
  // Model for PageSlider component.
  late PageSliderModel pageSliderModel;
  // Model for Pricing component.
  late PricingModel pricingModel;
  // Model for Contact component.
  late ContactModel contactModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    introModel = createModel(context, () => IntroModel());
    imageIntroModel = createModel(context, () => ImageIntroModel());
    featuresModel = createModel(context, () => FeaturesModel());
    pageSliderModel = createModel(context, () => PageSliderModel());
    pricingModel = createModel(context, () => PricingModel());
    contactModel = createModel(context, () => ContactModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    navbarModel.dispose();
    introModel.dispose();
    imageIntroModel.dispose();
    featuresModel.dispose();
    pageSliderModel.dispose();
    pricingModel.dispose();
    contactModel.dispose();
    footerModel.dispose();
  }

  /// Additional helper methods are added here.

}
