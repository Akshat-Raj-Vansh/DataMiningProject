import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padac/models/credentials.dart';
import 'package:padac/models/token.dart';
import 'package:padac/pages/home/home_screen.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:async/async.dart';

class AuthController extends GetxController {
  Rx<Credential> credential =
      Credential(email: '', token: Token(value: 'value')).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    Get.to(
      () => const HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 500),
    );
  }
}
