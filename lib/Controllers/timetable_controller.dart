import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nsutx/models/timetable_model.dart';

class TimetableController extends GetxController {
  final _timetable = TimetableModel().obs;

  get timetable => _timetable.value;

  @override
  void onReady() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');

    final manifest = json.decode(manifestContent) as Map<String, dynamic>;

    final profileJson = manifest.keys
        .where((path) => path == 'assets/student_data/timetable.json')
        .toList();

    final map = json.decode(
      await DefaultAssetBundle.of(Get.context!).loadString(profileJson[0]),
    ) as Map<String, dynamic>;

    _timetable.value = TimetableModel.fromJson(map);

    super.onReady();
  }
}
