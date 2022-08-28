import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/notice_model.dart';

class NoticeController extends GetxController {
  List<Notice> notices = <Notice>[].obs;

  @override
  void onReady() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');

    final manifest = json.decode(manifestContent) as Map<String, dynamic>;

    final noticesJson = manifest.keys
        .where((path) => path == 'assets/student_data/notices.json')
        .toList();

    final list = json.decode(
      await DefaultAssetBundle.of(Get.context!).loadString(noticesJson[0]),
    ) as List<dynamic>;

    // notices = list.map((e) => Notice.fromJson(e as Map<String, dynamic>)).toList();
    for (var i = 0; i < list.length; i++) {
      notices.add(Notice.fromJson(list[i] as Map<String, dynamic>));
    }

    super.onReady();
  }
}
