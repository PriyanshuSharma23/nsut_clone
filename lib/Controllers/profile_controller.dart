import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/profile_model.dart';

class ProfileController extends GetxController {
  final profileModel = ProfileModel(
    studentName: '',
    studentID: '',
    dOB: '',
    admission: '',
    brachName: '',
    category: '',
    degree: '',
    fTPT: '',
    gender: '',
    section: 0,
    specialization: '',
  ).obs;

  @override
  void onReady() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');

    final manifest = json.decode(manifestContent) as Map<String, dynamic>;

    final profileJson = manifest.keys
        .where((path) => path == 'assets/student_data/profile.json')
        .toList();

    final map = json.decode(
      await DefaultAssetBundle.of(Get.context!).loadString(profileJson[0]),
    ) as Map<String, dynamic>;

    profileModel.value = ProfileModel.fromJson(map);

    super.onReady();
  }
}
