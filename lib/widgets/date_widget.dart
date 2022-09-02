import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/utils/day.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Day.todaysDay(null),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          Day.todaysDate(),
          style: Get.find<ThemeController>().themeData.textTheme.caption,
        ),
      ],
    );
  }
}
