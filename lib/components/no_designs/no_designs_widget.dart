import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_designs_model.dart';
export 'no_designs_model.dart';

class NoDesignsWidget extends StatefulWidget {
  const NoDesignsWidget({Key? key}) : super(key: key);

  @override
  _NoDesignsWidgetState createState() => _NoDesignsWidgetState();
}

class _NoDesignsWidgetState extends State<NoDesignsWidget> {
  late NoDesignsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDesignsModel());

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
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.edit_off,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 90.0,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seems you don’t have any old designs.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Use our application to create your designs.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
