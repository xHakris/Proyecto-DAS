import '/auth/firebase_auth/auth_util.dart';
import '/components/registro/registro_widget.dart';
import '/components/restablecer_contrasena/restablecer_contrasena_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioSesionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  final emailAddressKey = GlobalKey();
  TextEditingController? emailAddressController;
  String? emailAddressSelectedOption;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
