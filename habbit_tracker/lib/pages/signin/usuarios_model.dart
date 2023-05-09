import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:habbit_tracker/pages/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:habbit_tracker/pages/perfil/perfil_controller.dart';

class usuario_model {
  late String user;
  late String pasw;
  UserProfile? userProfile;

  usuario_model({
    required this.user,
    required this.pasw,
    this.userProfile,
  });

  // Métodos adicionales para la actualización y eliminación del perfil del usuario.
}
