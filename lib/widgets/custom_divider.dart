import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.currentDate,
  }) : super(key: key);

  final String currentDate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          height: 30,
          thickness: 1.5,
          color: Get.isDarkMode ? Colors.white54 : Colors.black54,
        ),
        Positioned(
          top: -2,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 35,
            ),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? primaryDark : primaryLight,
            ),
            child: Text(
              currentDate,
              style: Get.theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
