import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/theme_controller.dart';

import 'package:nsutx/app_routes.dart';
import 'package:nsutx/bindings/initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ThemeController themeController = Get.put(ThemeController());
  InitialBindings().dependencies();

  runApp(Obx(
    () => GetMaterialApp(
      theme: Get.find<ThemeController>().themeData,
      getPages: appRoutes,
    ),
  ));
}
