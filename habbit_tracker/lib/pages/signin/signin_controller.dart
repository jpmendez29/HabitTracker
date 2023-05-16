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

      ),
    ),
    usuario_model(
      user: "j@j.com",
      pasw: "jpmendez",
      userProfile: UserProfile(
        id: '2',
        name: 'Juan Pablo',
        bio:
            'Ingeniero de sistemas buscando cumplir sus metas de habitos saludables',
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
  void updateUserProfile(String name, String bio) {
    if (currentUser != null && currentUser!.userProfile != null) {
      UserProfile updatedProfile = UserProfile(
        id: currentUser!.userProfile!.id,
        name: name,
        bio: bio,
      );
      currentUser!.updateUserProfile(updatedProfile);
      update();
    }
  }
}
