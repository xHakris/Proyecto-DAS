import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_projects_model.dart';
export 'empty_projects_model.dart';

class EmptyProjectsWidget extends StatefulWidget {
  const EmptyProjectsWidget({
    Key? key,
    this.title,
    this.bodyText,
  }) : super(key: key);

  final String? title;
  final String? bodyText;

  @override
  _EmptyProjectsWidgetState createState() => _EmptyProjectsWidgetState();
}

class _EmptyProjectsWidgetState extends State<EmptyProjectsWidget> {
  late EmptyProjectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyProjectsModel());

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
        Icon(
          Icons.folder_open,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 90.0,
        ),
      ],
    );
  }
}
