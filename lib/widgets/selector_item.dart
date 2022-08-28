import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class SelectorItem extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  final double height;
  final double width;

  const SelectorItem({
    Key? key,
    required this.isSelected,
    required this.child,
    this.height = 25,
    this.width = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Get.isDarkMode ? primaryDark : primaryLight;
    final secondary = Get.isDarkMode ? secondaryDark : secondaryLight;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width,
      height: height,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? secondary : primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (!isSelected)
            BoxShadow(
              color: Get.isDarkMode
                  ? Colors.black.withOpacity(0.6)
                  : Colors.grey.withOpacity(0.3),
              offset: const Offset(2, 8),
              blurRadius: 20,
              spreadRadius: 1,
            ),
        ],
      ),
      margin:
          isSelected ? const EdgeInsets.only(left: 8) : const EdgeInsets.all(0),
      child: Center(child: child),
    );
  }
}
