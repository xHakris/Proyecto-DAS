import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioSesionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9ad5nczl' /* requerido! */,
      );
    }

    if (val.length > 40) {
      return FFLocalizations.of(context).getText(
        '1w2pldnr' /* correo Invalido */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3zywwoxt' /* correo Invalido */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p5nxr1ta' /* requerido! */,
      );
    }

    if (val.length > 40) {
      return FFLocalizations.of(context).getText(
        '4uyhcchs' /* clave invalida */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
