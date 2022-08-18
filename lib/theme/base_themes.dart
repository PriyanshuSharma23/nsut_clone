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
    ));
  }
}
