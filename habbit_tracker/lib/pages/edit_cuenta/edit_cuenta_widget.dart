import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_cuenta_model.dart';
export 'edit_cuenta_model.dart';
import 'package:habbit_tracker/pages/signin/signin_controller.dart';
import 'package:habbit_tracker/pages/signin/usuarios_model.dart';
import 'package:get/get.dart';
import 'package:habbit_tracker/pages/perfil/perfil_controller.dart';

class EditCuentaWidget extends StatefulWidget {
  const EditCuentaWidget({Key? key}) : super(key: key);

  @override
  _EditCuentaWidgetState createState() => _EditCuentaWidgetState();
}

class _EditCuentaWidgetState extends State<EditCuentaWidget> {
  late EditCuentaModel _model;
  final signin_controller _signinController = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCuentaModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  void updateUserProfile(UserProfile userProfile, String newName,
      String newUsername, String newBio) {
    // Actualiza el UserProfile con la nueva información
    // Aquí también puedes actualizar la base de datos, el almacenamiento local u otro lugar donde esté almacenada la información del usuario
  }
  @override
  Widget build(BuildContext context) {
    if (_signinController.currentUser == null) {
      return Center(child: Text('No hay usuario autenticado'));
    }
    final usuario_model currentUser = _signinController.currentUser!;
    final UserProfile? userProfile = currentUser.userProfile;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF3C7E5B),
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.8, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Text(
                    'Mi cuenta',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF3C7E5B),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          lineHeight: 1.0,
                        ),
                  ),
                ),
              ),
              Container(
                width: 120.0,
                height: 120.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/id/64/200/300',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  'Editar foto de perfil',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito',
                        color: Color(0xFF3C7E5B),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Nombre',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF69B884),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 200.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController1,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: userProfile?.name ?? 'Nombre no disponible',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF3C7E5B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                          ),
                      maxLines: null,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Nombre de usuario',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF69B884),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 200.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController2,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: currentUser.user,
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF3C7E5B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                          ),
                      maxLines: null,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Biografia',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF69B884),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 200.0,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController3,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: userProfile?.bio ?? 'Biografía no disponible',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF3C7E5B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                          ),
                      maxLines: 7,
                      validator:
                          _model.textController3Validator.asValidator(context),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Correo electronico',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF69B884),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Fecha de nacimiento',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF69B884),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                  ),
                  Container(
                    width: 200.0,
                    height: 20.0,
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _model.textController5,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '20/02/2023',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Nunito',
                                  color: Color(0xFF3C7E5B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                          ),
                      maxLines: null,
                      validator:
                          _model.textController5Validator.asValidator(context),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    // Aquí puedes agregar validaciones adicionales antes de actualizar el perfil, si es necesario
                    if (userProfile != null) {
                      updateUserProfile(
                        userProfile,
                        _model.textController1.text, // Nombre actualizado
                        _model.textController2
                            .text, // Nombre de usuario actualizado
                        _model.textController3.text, // Biografía actualizada
                      );
                    }
                    // Navega hacia atrás o redirige al usuario a la pantalla anterior si es necesario
                    context.pushNamed('login');
                  },
                  text: 'Confirmar Cambios',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF3C7E5B),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
