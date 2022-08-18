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
      appBarTheme: theme.appBarTheme.copyWith(
        color: primaryLight,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawerTheme: theme.drawerTheme.copyWith(
        backgroundColor: primaryLight,
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: primaryLight,
        elevation: 2,
        selectedItemColor: secondaryLight,
      ),
    );
  }
}
