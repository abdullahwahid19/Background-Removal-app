import '/components/footer/footer_widget.dart';
import '/components/image_processor/image_processor_widget.dart';
import '/components/my_designs/my_designs_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for ImageProcessor component.
  late ImageProcessorModel imageProcessorModel;
  // Model for myDesigns component.
  late MyDesignsModel myDesignsModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    imageProcessorModel = createModel(context, () => ImageProcessorModel());
    myDesignsModel = createModel(context, () => MyDesignsModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    navbarModel.dispose();
    imageProcessorModel.dispose();
    myDesignsModel.dispose();
    footerModel.dispose();
  }

  /// Additional helper methods are added here.

}
