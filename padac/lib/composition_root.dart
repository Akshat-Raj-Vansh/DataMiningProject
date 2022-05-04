import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:padac/cache/ilocal_store.dart';
import 'package:padac/cache/local_store.dart';
import 'package:padac/controllers/auth_controller.dart';
import 'package:padac/models/token.dart';
import 'package:padac/pages/auth/components/login_screen.dart';
import 'package:padac/pages/auth/components/register_screen.dart';
import 'package:padac/pages/home/home_screen.dart';
import 'package:padac/pages/splash/splash_sceen.dart';
import 'package:http/http.dart';
import 'package:padac/services/auth/auth_service.dart';
import 'package:padac/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompositionRoot {
  static late SharedPreferences sharedPreferences;
  static late ILocalStore localStore;

  static configure() async {
    sharedPreferences = await SharedPreferences.getInstance();
    localStore = LocalStore(sharedPreferences);
    log('CompositionRoot configured');
  }

  static Future<Widget> start() async {
    Token token = await localStore.getToken();
    // return token == null ? splashScreen() : createHomeUI();
    return splashScreen();
  }

  static Widget splashScreen() {
    return SplashScreen();
  }

  static Widget createLoginScreen() {
    return LoginScreen();
  }

  static Widget createRegisterScreen() {
    return RegisterScreen();
  }

  static Widget createHomeUI() {
    return HomeScreen();
  }
}
