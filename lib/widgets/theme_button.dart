import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/theme_controller.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.find<ThemeController>().toggleTheme();
      },
      icon: const Icon(
        Icons.brightness_6,
      ),
    );
  }
}
