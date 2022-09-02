import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/theme_controller.dart';

import 'package:nsutx/app_routes.dart';
import 'package:nsutx/bindings/initial_bindings.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(Obx(
      () => GetMaterialApp(
        theme: Get.find<ThemeController>().themeData,
        getPages: appRoutes,
      ),
    ));
  });
}
