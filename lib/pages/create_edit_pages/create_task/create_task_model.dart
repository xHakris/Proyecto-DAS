import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTaskModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TaskNameF widget.
  String? taskNameFValue;
  FormFieldController<String>? taskNameFValueController;
  // State field(s) for DescriptionH widget.
  String? descriptionHValue;
  FormFieldController<String>? descriptionHValueController;
  // State field(s) for Grade widget.
  String? gradeValue;
  FormFieldController<String>? gradeValueController;
  // State field(s) for statusSelect widget.
  String? statusSelectValue;
  FormFieldController<String>? statusSelectValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AllTasksRecord? newTask;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityCreated;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
