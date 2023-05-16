import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:habbit_tracker/pages/signin/usuarios_model.dart';
import 'package:habbit_tracker/pages/perfil/perfil_controller.dart';





class signin_controller extends GetxController {

  late final List<usuario_model> usuarios = <usuario_model>[
    usuario_model(
      user: "hola123",
      pasw: "12345",
      userProfile: UserProfile(
        id: '1',
        name: 'David Maldonado',
        bio:
            'Ingeniero de sistemas buscando cumplir sus metas de habitos saludables',
        birthdate: DateTime.now(),
        imageUrl: 'https://example.com/default-image.png',
      ),
    ),
  ].obs;

  Future<void> setuser(us, pasw) async => {
        usuarios.add(usuario_model(user: us, pasw: pasw, userProfile: null)),
      };

  String usr() {
    final user =
        usuarios.map((e) => {"usuario : ${e.user},contraseña : ${e.pasw}"});
    return "$user";
  }

  usuario_model? currentUser;
  bool validatepasw(usr, pasw) {
    setuser(usr, pasw);
    // Crea y guarda un nuevo perfil de usuario al registrarse.
    usuarios.last.userProfile = UserProfile(
      id: usuarios.last.user,
      name: '',
      bio: '',
      birthdate: DateTime.now(),
      imageUrl: '',
    );
    return true;
  }

  bool exist(usr, pasw) {
    try {
      final usexist = usuarios.singleWhere((element) => element.user == usr);
      if (usexist.pasw == pasw) {
        currentUser = usexist;
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  // Método para actualizar el perfil del usuario actual
  void updateUserProfile(
      String name, String bio, DateTime birthdate, String imageUrl) {
    if (currentUser != null && currentUser!.userProfile != null) {
      UserProfile updatedProfile = UserProfile(
        id: currentUser!.userProfile!.id,
        name: name,
        bio: bio,
        birthdate: birthdate,
        imageUrl: imageUrl,
      );
      currentUser!.updateUserProfile(updatedProfile);
      update();
    }
  }
}
