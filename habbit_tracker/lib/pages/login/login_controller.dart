import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class login_controller extends GetxController {
  String usrerstring(user, pas) {
    return ("usuario: $user contraseña: $pas");
  }

  bool validateusr(usr, pasw, us1, pasw1) {
    if (pasw == pasw1 && usr == us1) {
      log(usrerstring(usr, pasw));
      return true;
    }
    return false;
  }
}
