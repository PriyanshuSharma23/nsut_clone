import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/name_icon.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class CircleIcon extends StatelessWidget {
  final NameIcon nameIcon;
  const CircleIcon({
    Key? key,
    required this.nameIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isDark ? secondaryDark : secondaryLight,
              width: 2,
            ),
          ),
          child: IconButton(
            onPressed: () {
              Get.toNamed(nameIcon.to);
            },
            icon: Icon(nameIcon.icon),
          ),
        ),
        Text(nameIcon.name, style: Get.theme.textTheme.bodyText1),
      ],
    );
  }
}
