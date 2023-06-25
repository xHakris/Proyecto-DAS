import '/components/logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaInicialModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Logo component.
  late LogoModel logoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logoModel = createModel(context, () => LogoModel());
  }

  void dispose() {
    logoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
