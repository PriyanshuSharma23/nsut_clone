import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? radius;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? Get.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: isDark ? buttonDark : buttonLight,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Text(
            text,
            style: Get.theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
