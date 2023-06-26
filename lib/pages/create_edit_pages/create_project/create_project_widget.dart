import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_project_model.dart';
export 'create_project_model.dart';

class CreateProjectWidget extends StatefulWidget {
  const CreateProjectWidget({Key? key}) : super(key: key);

  @override
  _CreateProjectWidgetState createState() => _CreateProjectWidgetState();
}

class _CreateProjectWidgetState extends State<CreateProjectWidget> {
  late CreateProjectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProjectModel());

    _model.taskNameController ??= TextEditingController();
    _model.descriptionController ??= TextEditingController();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'zhq7wtzw' /* Crear Evento */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 48.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.taskNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '9duf9kbf' /* Nombre del proyecto */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Space Grotesk',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 32.0, 20.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Space Grotesk',
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                                textAlign: TextAlign.start,
                                validator: _model.taskNameControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.descriptionController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    'j3scp78v' /* Introduce la descripción aquí.... */,
                                  ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20.0, 32.0, 20.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                textAlign: TextAlign.start,
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                validator: _model.descriptionControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'ja4yfzm3' /* Cursos */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'i8s3cnuf' /* Congresos */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '8zn4kxqa' /* Webinars */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'inlssi70' /* Conferencias */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '1n27e4de' /* Socializaciones */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue1 = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'kdkesjiu' /* Selecciona el Tipo de Curso */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '0x8ejlwx' /* Software */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'plyfa1ll' /* Telecomunicaciones */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '0vjscljd' /* Tecnologías de la Información */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '8lukukje' /* FISEI */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'rnid91ij' /* Publico General */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue2 = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  't0bot3o1' /* Selecciona la Carrera */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController3 ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '8q12vg70' /* De Pago */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '3h6xkup4' /* Gratuito */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue3 = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  'yt3xsd25' /* Selecciona el Servicio */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                // This creates the project for tasks to be assigned to.

                                await ProjectsRecord.collection.doc().set({
                                  ...createProjectsRecordData(
                                    owner: currentUserReference,
                                    projectName: _model.taskNameController.text,
                                    description:
                                        _model.descriptionController.text,
                                    numberTasks: 0,
                                    completedTasks: 0,
                                    lastEdited: getCurrentTimestamp,
                                    typeCourse: _model.dropDownValue1,
                                    career: _model.dropDownValue2,
                                    payment: _model.dropDownValue3,
                                  ),
                                  'usersAssigned': [currentUserReference],
                                });

                                await ProjectListRecord.collection.doc().set({
                                  ...createProjectListRecordData(
                                    userRef: currentUserReference,
                                  ),
                                  'projects': [_model.taskNameController.text],
                                });
                                context.pop();
                              },
                              text: FFLocalizations.of(context).getText(
                                'gql7sgl9' /* Crear Evento */,
                              ),
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
