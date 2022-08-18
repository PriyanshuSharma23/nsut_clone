import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class ThemeController extends GetxController {
  final _themeData = ThemeData.light().obs;

  late ThemeData lightTheme;
  late ThemeData darkTheme;

  @override
  void onInit() {
    lightTheme = LightTheme().generateTheme();
    darkTheme = DarkTheme().generateTheme();

    // get system's default theme
    if (Get.context is BuildContext) {
      if (Theme.of(Get.context!).brightness == Brightness.dark) {
        _themeData.value = darkTheme;
      } else {
        _themeData.value = lightTheme;
      }
    } else {
      _themeData.value = lightTheme;
    }

    super.onInit();
  }

  ThemeData get themeData => _themeData.value;
  toggleTheme() {
    _themeData.value = _themeData.value.brightness == Brightness.light
        ? darkTheme
        : lightTheme;
  }
}
