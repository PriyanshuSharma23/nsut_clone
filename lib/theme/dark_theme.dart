import 'package:flutter/material.dart';

import 'base_themes.dart';

const primaryDark = Color(0xFF1B1F2B);
const secondaryDark = Color(0xFFcd395d);

const redDark = Color(0xffef5f5d);
const greenDark = Color(0xff47c27a);

class DarkTheme with BaseTheme {
  ThemeData generateTheme() {
    final theme = ThemeData.dark();

    return theme.copyWith(
        primaryColor: primaryDark,
        splashColor: secondaryDark,
        scaffoldBackgroundColor: primaryDark,
        textTheme: font().apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        drawerTheme: theme.drawerTheme.copyWith(
          backgroundColor: primaryDark,
        ),
        appBarTheme: appBarTheme().copyWith(
          iconTheme: const IconThemeData(
            color: secondaryDark,
          ),
          actionsIconTheme: const IconThemeData(
            color: secondaryDark,
          ),
        ),
        bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.shifting,
          backgroundColor: primaryDark,
          elevation: 2,
          selectedItemColor: secondaryDark,
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            size: 24,
          ),
        ));
  }
}
