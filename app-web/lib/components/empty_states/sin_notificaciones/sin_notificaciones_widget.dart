import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'sin_notificaciones_model.dart';
export 'sin_notificaciones_model.dart';

class SinNotificacionesWidget extends StatefulWidget {
  const SinNotificacionesWidget({
    Key? key,
    this.title,
    this.bodyText,
  }) : super(key: key);

  final String? title;
  final String? bodyText;

  @override
  _SinNotificacionesWidgetState createState() =>
      _SinNotificacionesWidgetState();
}

class _SinNotificacionesWidgetState extends State<SinNotificacionesWidget> {
  late SinNotificacionesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinNotificacionesModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.network(
          'https://lottie.host/7d591c38-dd02-4d16-aa1c-b488f9e68525/XC65c8QPHC.json',
          width: 230.0,
          height: 230.0,
          fit: BoxFit.cover,
          frameRate: FrameRate(30.0),
          animate: true,
        ),
      ],
    );
  }
}
