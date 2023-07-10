import '/backend/backend.dart';
import '/components/modal_add_members/modal_add_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_project_model.dart';
export 'modal_project_model.dart';

class ModalProjectWidget extends StatefulWidget {
  const ModalProjectWidget({
    Key? key,
    this.eventoRef,
  }) : super(key: key);

  final EventoRecord? eventoRef;

  @override
  _ModalProjectWidgetState createState() => _ModalProjectWidgetState();
}

class _ModalProjectWidgetState extends State<ModalProjectWidget> {
  late ModalProjectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalProjectModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 6.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 800.0,
            constraints: BoxConstraints(
              maxWidth: 930.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 16.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  widget.eventoRef!.nombre,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily),
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${widget.eventoRef!.areaPertenece}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  widget.eventoRef!.diasDuracion.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: Color(0xFF95A1AC),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 16.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 30.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 1.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: double.infinity,
                                    child: ModalAddMembersWidget(
                                      eventoRef: widget.eventoRef,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final projectMembers =
                                      widget.eventoRef!.equipo.toList();
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(projectMembers.length,
                                            (projectMembersIndex) {
                                      final projectMembersItem =
                                          projectMembers[projectMembersIndex];
                                      return FutureBuilder<UsersRecord>(
                                        future: UsersRecord.getDocumentOnce(
                                            projectMembersItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          final userCarUsersRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 36.0,
                                                height: 36.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  userCarUsersRecord.photoUrl,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  );
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4r29z75b' /* Asignar */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SelectionArea(
                                  child: Text(
                                FFLocalizations.of(context).getText(
                                  't5thu3gr' /* Completed Tasks */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              )),
                            ),
                            Expanded(
                              child: SelectionArea(
                                  child: Text(
                                FFLocalizations.of(context).getText(
                                  'fycpdliq' /* Number of Tasks */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    't39dexai' /* Cursos en Progreso */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'gd3bhzsf' /* Cursos Completados */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'dy7qxdlp' /* Eventos */,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(),
                                Container(),
                                Container(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
