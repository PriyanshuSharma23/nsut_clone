import 'package:flutter/material.dart';

import 'base_themes.dart';

const primaryLight = Color(0xFFF5F5F5);
const secondaryLight = Color(0xFFFB6487);

const redLight = Color(0xffeb5757);
const greenLight = Color(0xff6fcf97);

class LightTheme with BaseTheme {
  ThemeData generateTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        secondary: secondaryLight,
      ),
      primaryColor: primaryLight,
      scaffoldBackgroundColor: primaryLight,
      textTheme: font().apply(
        displayColor: Colors.black,
        bodyColor: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      appBarTheme: appBarTheme().copyWith(
        color: primaryLight,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: secondaryLight,
        ),
        iconTheme: const IconThemeData(
          color: secondaryLight,
        ),
      ),
      drawerTheme: theme.drawerTheme.copyWith(
        backgroundColor: primaryLight,
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryLight,
        elevation: 2,
        selectedItemColor: secondaryLight,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          size: 24,
        ),
      ),
    );
  }
}
