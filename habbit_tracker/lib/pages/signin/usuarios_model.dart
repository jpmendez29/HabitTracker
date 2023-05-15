import 'package:habbit_tracker/pages/perfil/perfil_controller.dart';
import 'package:get/get.dart';

class usuario_model extends GetxController {
  String user;
  String pasw;
  UserProfile? userProfile;

  usuario_model({
    required this.user,
    required this.pasw,
    this.userProfile,
  });

  // Método para actualizar el perfil del usuario
  void updateUserProfile(UserProfile updatedProfile) {
    this.userProfile = updatedProfile;
    update();
  }
}
