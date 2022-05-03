import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padac/models/credentials.dart';
import 'package:padac/models/features.dart';
import 'package:padac/models/token.dart';
import 'package:padac/pages/home/home_screen.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:async/async.dart';

class CropController extends GetxController {
  Rx<Features> features = Features.initialize().obs;

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
