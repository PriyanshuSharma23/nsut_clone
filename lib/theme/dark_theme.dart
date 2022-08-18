import 'package:flutter/material.dart';

import 'base_themes.dart';

const primaryDark = Color(0xFF1B1F2B);
const secondaryLight = Color(0xFFFB6487);

class DarkTheme with BaseTheme {
  generateTheme() {
    final theme = ThemeData.dark();
    return theme.copyWith(
      primaryColor: primaryDark,
      scaffoldBackgroundColor: primaryDark,
      textTheme: font(),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
