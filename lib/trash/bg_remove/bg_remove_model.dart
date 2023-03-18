import '/components/footer/footer_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/remove_bg_result_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BgRemoveModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for RemoveBgResult component.
  late RemoveBgResultModel removeBgResultModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    removeBgResultModel = createModel(context, () => RemoveBgResultModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    navbarModel.dispose();
    removeBgResultModel.dispose();
    footerModel.dispose();
  }

  /// Additional helper methods are added here.

}
