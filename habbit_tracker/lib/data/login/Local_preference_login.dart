import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:habbit_tracker/pages/signin/usuarios_model.dart';

class prefs_controller extends GetxController {
  Future<void> storeUserInfo(user, pasw) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log(' usuario almacenado ${user} ${pasw}');
    await prefs.setBool("storedUser", true);
    await prefs.setString("user", user);
    await prefs.setString("pasw", pasw);
  }

  Future<void> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('obtener usuario');

    bool storedUser = await prefs.getBool("storedUser") ?? false;
    log('UserLocalSharedPrefs getUserInfo storedUser? <$storedUser>');

    if (storedUser) {
      var savedUser = await prefs.getString("user") ?? "";
      var savedPassword = await prefs.getString("pasw") ?? "";
      log('UserLocalSharedPrefs getUserInfo <$savedUser< <$savedPassword>');

      return Future.value(usuario_model(user: savedUser, pasw: savedPassword));
    } else {
      log('UserLocalSharedPrefs getUserInfo no user');
      return Future.error("No user");
    }
  }

  Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('Limpiar informacion de usuario');
    await prefs.setString("user", "");
    await prefs.setString("pasw", "");
    await prefs.setBool("storedUser", false);
  }

  Future<bool> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('logged') ?? false;
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('UserLocalSharedPrefs logout');
    await prefs.setBool("logged", false);
  }

  Future<bool> isStoringUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool("storedUser") ?? false;
  }

  deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
