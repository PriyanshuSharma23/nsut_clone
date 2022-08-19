import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/course.dart';

class AttendanceController extends GetxController {
  final courses = [].obs;

  @override
  void onReady() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');

    final manifest = json.decode(manifestContent) as Map<String, dynamic>;

    final attendanceJson = manifest.keys
        .where((path) => path == 'assets/student_data/attendance.json')
        .toList();

    final map = json.decode(
      await DefaultAssetBundle.of(Get.context!).loadString(attendanceJson[0]),
    ) as Map<String, dynamic>;

    courses.value = (map['Courses'] as List)
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
