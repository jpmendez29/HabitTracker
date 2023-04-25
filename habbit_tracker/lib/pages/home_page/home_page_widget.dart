import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 57.64, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            125.0, 7.73, 48.16, 0.0),
                        child: Text(
                          'Mis hábitos',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito',
                                    color: Color(0xFF3C7E5B),
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: FaIcon(
                        FontAwesomeIcons.pen,
                        color: Color(0xFFE2E9BA),
                        size: 30.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 28.63, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(27.74, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 236.3,
                      height: 93.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE2E9BA),
                        borderRadius: BorderRadius.circular(15.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.33, 0.0, 13.0, 0.0),
                          child: Text(
                            '¡Establecer objetivos es el primer paso para convertir lo invisible en visible!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF3C7E5B),
                                  letterSpacing: 0.23,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.18,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/Abby_Toss.png',
                      width: 99.0,
                      height: 88.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Diario',
                      options: FFButtonOptions(
                        width: 171.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF3C7E5B),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.23,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.18,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Semanal',
                    options: FFButtonOptions(
                      width: 171.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF69B884),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.23,
                                fontWeight: FontWeight.normal,
                                lineHeight: 1.18,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: FaIcon(
                      FontAwesomeIcons.lessThan,
                      color: Color(0xFF3C7E5B),
                      size: 22.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(37.5, 0.0, 37.5, 0.0),
                  child: Text(
                    'Lunes',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF3C7E5B),
                          fontSize: 22.0,
                          letterSpacing: 0.23,
                          fontWeight: FontWeight.bold,
                          lineHeight: 0.73,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderWidth: 1.0,
                    buttonSize: 41.0,
                    icon: FaIcon(
                      FontAwesomeIcons.greaterThan,
                      color: Color(0xFF3C7E5B),
                      size: 22.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 17.0),
              child: Container(
                width: 334.5,
                height: 3.0,
                decoration: BoxDecoration(
                  color: Color(0xFF69B884),
                  borderRadius: BorderRadius.circular(3.0),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  CircularPercentIndicator(
                    percent: 0.75,
                    radius: 60.0,
                    lineWidth: 16.0,
                    animation: true,
                    progressColor: Color(0xFFFFB87E),
                    backgroundColor: Color(0xFFFEDCC1),
                    center: Text(
                      '50%',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: 0.6,
                    radius: 60.0,
                    lineWidth: 16.0,
                    animation: true,
                    progressColor: Color(0xFFF07D6D),
                    backgroundColor: Color(0xFFFCC8C1),
                    center: Text(
                      '50%',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: 0.0,
                    radius: 60.0,
                    lineWidth: 16.0,
                    animation: true,
                    progressColor: Color(0xFF659C83),
                    backgroundColor: Color(0xFFADDBC7),
                    center: Text(
                      '50%',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: 0.25,
                    radius: 60.0,
                    lineWidth: 16.0,
                    animation: true,
                    progressColor: Color(0xFFCF8DE7),
                    backgroundColor: Color(0xFFE6CEEF),
                    center: Text(
                      '50%',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: 0.5,
                    radius: 60.0,
                    lineWidth: 24.0,
                    animation: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).accent4,
                    center: Text(
                      '50%',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                  CircularPercentIndicator(
                    percent: 0.5,
                    radius: 60.0,
                    lineWidth: 24.0,
                    animation: true,
                    progressColor: FlutterFlowTheme.of(context).primary,
                    backgroundColor: FlutterFlowTheme.of(context).accent4,
                    center: Text(
                      '50%',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 0.0,
                  buttonSize: 50.0,
                  fillColor: Color(0xFF3C7E5B),
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFFE2E9BA),
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'AddHabit',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 350),
                        ),
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
