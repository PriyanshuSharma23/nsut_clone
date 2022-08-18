import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nsutx/app_routes.dart';
import 'package:nsutx/bindings/initial_bindings.dart';

import 'Controllers/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ensure that the initial bindings are set
  InitialBindings().dependencies();

  runApp(Obx(() {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().themeData,
      getPages: appRoutes,
    );
  }));
}
