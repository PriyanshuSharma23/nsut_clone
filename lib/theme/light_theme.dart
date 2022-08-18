import 'package:flutter/material.dart';

import 'base_themes.dart';

const primaryLight = Color(0xFFF5F5F5);
const secondaryLight = Color(0xFFFB6487);

class LightTheme with BaseTheme {
  ThemeData generateTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: primaryLight,
      textTheme: font().apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
