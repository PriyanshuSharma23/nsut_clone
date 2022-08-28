import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin BaseTheme {
  TextTheme font() {
    return GoogleFonts.montserratTextTheme(const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
      ),
      displayLarge: TextStyle(
        fontSize: 32,
      ),
    ));
  }

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      centerTitle: true,
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: font().titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
