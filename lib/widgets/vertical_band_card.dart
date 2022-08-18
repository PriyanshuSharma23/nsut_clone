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

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          // subtle shadow
          BoxShadow(
            color: currentThemeDark ? Colors.black : Colors.grey,
            offset: const Offset(6, 10),
            spreadRadius: -20,
            blurRadius: 20,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: currentThemeDark ? primaryDark : primaryLight,
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
