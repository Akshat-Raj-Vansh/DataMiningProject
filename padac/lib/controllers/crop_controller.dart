import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:padac/models/features.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CropController extends GetxController {
  var selectedPage = 0.obs;
  var featureValue = [].obs;
  var featureName = [].obs;
  var pnk = [[], [], []].obs;
  var ph = [].obs;
  var rainfall = [].obs;
  var temperature = [].obs;
  var humidity = [].obs;

  late FirebaseDatabase database;
  late FirebaseFirestore firestore;
  @override
  void onInit() {
    database = FirebaseDatabase.instance;
    firestore = FirebaseFirestore.instance;
    getChartData();
    super.onInit();
  }

  void changePage(int page) {
    selectedPage.value = page;
  }

  Future<void> getValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      List<String> names = List<String>.from(data.keys.toList());
      featureValue.value = values;
      featureName.value = names;
      log(featureName.toString());
      log(featureValue.toString());
    });
  }

  Future<void> getChartData() async {
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    await data.doc('123456784').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        dynamic docs = documentSnapshot.data();
        pnk.value = [docs['P'], docs['N'], docs['K']];
        ph.value = docs['ph'];
        rainfall.value = docs['rainfall'];
        temperature.value = docs['temperature'];
        humidity.value = docs['humidity'];
        log(pnk.value[0].length.toString());
      } else {
        log('Document does not exist on the database');
      }
    });
  }

  Future<void> getPHValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      List<String> names = List<String>.from(data.keys.toList());
      featureValue.value = values;
      featureName.value = names;
      log(featureName.toString());
      log(featureValue.toString());
    });
  }

  Future<void> getRainfallValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      List<String> names = List<String>.from(data.keys.toList());
      featureValue.value = values;
      featureName.value = names;
      log(featureName.toString());
      log(featureValue.toString());
    });
  }

  Future<void> getTemperatureValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      List<String> names = List<String>.from(data.keys.toList());
      featureValue.value = values;
      featureName.value = names;
      log(featureName.toString());
      log(featureValue.toString());
    });
  }

  Future<void> getHumidityValues() async {
    DatabaseReference dbReference = FirebaseDatabase.instance.ref('123456784/');
    dbReference.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      List<String> values = List<String>.from(data.values.toList());
      List<String> names = List<String>.from(data.keys.toList());
      featureValue.value = values;
      featureName.value = names;
      log(featureName.toString());
      log(featureValue.toString());
    });
  }
}
