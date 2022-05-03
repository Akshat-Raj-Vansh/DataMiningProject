import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padac/models/credentials.dart';
import 'package:padac/models/features.dart';
import 'package:padac/models/token.dart';
import 'package:padac/pages/home/home_screen.dart';
import 'package:padac/services/auth/iauth_service.dart';
import 'package:async/async.dart';
import 'package:firebase_database/firebase_database.dart';

class CropController extends GetxController {
  Rx<Features> features = Features.initialize().obs;
  var dashboard = ['0', '0', '0', '0', '0', '0'].obs;
  late FirebaseDatabase database;
  @override
  void onInit() {
    database = FirebaseDatabase.instance;
    super.onInit();
  }

  Future<void> getValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      dashboard.value = values;
    });
  }

  Future<void> login(String email, String password) async {
    Get.to(
      () => const HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 500),
    );
  }
}
