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

class ImageEditorModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - watermarkImg] action in ImageEditor widget.
  String? wImg;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    navbarModel.dispose();
    footerModel.dispose();
  }

  /// Additional helper methods are added here.

}
