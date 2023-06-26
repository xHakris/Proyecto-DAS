import '/backend/backend.dart';
import '/components/u_i_components/drawer_nav/drawer_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainProjectsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
