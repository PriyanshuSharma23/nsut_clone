import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/theme_controller.dart';

const darkThemeColor = Color(0xFFcd395d);
const lightThemeColor = Color(0xFFfe6486);

class BandCard extends StatelessWidget {
  final Widget child;
  const BandCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color c;
    final currentTheme = Get.find<ThemeController>().themeData;
    if (currentTheme.brightness == Brightness.dark) {
      c = darkThemeColor;
    } else {
      c = lightThemeColor;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: c,
              width: 10,
            ),
          ),
          // borderRadius:
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: child,
        ),
      ),
    );
  }
}
