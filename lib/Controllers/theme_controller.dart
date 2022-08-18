import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class ThemeController extends GetxController {
  final _themeData = ThemeData.light().obs;

  late final ThemeData _lightTheme;
  late final ThemeData _darkTheme;

  @override
  void onInit() {
    initialize();

    SchedulerBinding.instance.window.platformBrightness == Brightness.dark
        ? _themeData.value = _darkTheme
        : _themeData.value = _lightTheme;

    super.onInit();
  }

  void initialize() {
    _lightTheme = LightTheme().generateTheme();
    _darkTheme = DarkTheme().generateTheme();
  }

  ThemeData get themeData => _themeData.value;

  toggleTheme() {
    _themeData.value = _themeData.value.brightness == Brightness.light
        ? _darkTheme
        : _lightTheme;
  }
}
