import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/change_photo/change_photo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MovilEditarPerfilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for txtsemestre widget.
  TextEditingController? txtsemestreController;
  String? Function(BuildContext, String?)? txtsemestreControllerValidator;
  // State field(s) for txttelefono widget.
  TextEditingController? txttelefonoController;
  String? Function(BuildContext, String?)? txttelefonoControllerValidator;
  // State field(s) for txtcarrera widget.
  TextEditingController? txtcarreraController;
  String? Function(BuildContext, String?)? txtcarreraControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    txtsemestreController?.dispose();
    txttelefonoController?.dispose();
    txtcarreraController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}