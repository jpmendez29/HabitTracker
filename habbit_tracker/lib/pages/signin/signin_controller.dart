import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:habbit_tracker/pages/signin/usuarios_model.dart';
import 'package:habbit_tracker/pages/perfil/perfil_controller.dart';

class signin_controller extends GetxController {
  late final List<usuario_model> usuarios = <usuario_model>[
    usuario_model(user: "admin@outlook.com", pasw: "adminpasw")
  ].obs;

  void setuser(us, pasw) => {
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
}
