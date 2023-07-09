import '/auth/firebase_auth/auth_util.dart';
import '/components/componente_inicio_sesion_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComponenteRegistroModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordC widget.
  TextEditingController? passwordCController;
  late bool passwordCVisibility;
  String? Function(BuildContext, String?)? passwordCControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordCVisibility = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    passwordCController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
