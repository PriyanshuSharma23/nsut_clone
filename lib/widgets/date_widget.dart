import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/utils/day.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          Day.todaysDay(),
          style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          Day.todaysDate(),
          style: Theme.of(Get.context!).textTheme.titleSmall,
        ),
      ],
    );
  }
}
