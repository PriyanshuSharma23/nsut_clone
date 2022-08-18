import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

import '../Controllers/theme_controller.dart';

const darkThemeColor = Color(0xFFcd395d);
const lightThemeColor = Color(0xFFfe6486);

class BandCard extends StatelessWidget {
  final Widget child;
  const BandCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color c;
    final currentThemeDark =
        Get.find<ThemeController>().themeData.brightness == Brightness.dark;
    if (currentThemeDark) {
      c = darkThemeColor;
    } else {
      c = lightThemeColor;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              // subtle shadow
              // BoxShadow(
              //   color: currentThemeDark ? primaryDark : primaryLight,
              //   offset: const Offset(0, 5),
              //   blurRadius: 10,
              // )
            ],
            color: Colors.grey.withOpacity(0.1),
            border: BorderDirectional(
              start: BorderSide(
                color: c,
                width: 20,
              ),
            ),
            // borderRadius:
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
