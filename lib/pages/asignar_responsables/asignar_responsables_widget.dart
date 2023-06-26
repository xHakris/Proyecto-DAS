import '/components/u_i_components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'asignar_responsables_model.dart';
export 'asignar_responsables_model.dart';

class AsignarResponsablesWidget extends StatefulWidget {
  const AsignarResponsablesWidget({Key? key}) : super(key: key);

  @override
  _AsignarResponsablesWidgetState createState() =>
      _AsignarResponsablesWidgetState();
}

class _AsignarResponsablesWidgetState extends State<AsignarResponsablesWidget> {
  late AsignarResponsablesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignarResponsablesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.webNavModel,
            updateCallback: () => setState(() {}),
            child: WebNavWidget(),
          ),
        ),
      ),
    );
  }
}
