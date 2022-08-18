import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'package:nsutx/app_routes.dart';
import 'package:nsutx/bindings/initial_bindings.dart';

import 'Controllers/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ensure that the initial bindings are set
  InitialBindings().dependencies();

  // check device default theme
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  if (brightness == Brightness.dark) {
    Get.find<ThemeController>().toggleTheme();
  }

  runApp(
    Obx(
      () => GetMaterialApp(
        theme: Get.find<ThemeController>().themeData,
        getPages: appRoutes,
      ),
    ),
  );
}
