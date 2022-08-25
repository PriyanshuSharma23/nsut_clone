import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/timetable_model.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class TimeTableTile extends StatelessWidget {
  final Class clazz;

  const TimeTableTile({
    Key? key,
    required this.clazz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.theme.brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(maxWidth: Get.width * 0.9),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                clazz.courseName,
                style: Get.theme.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                clazz.courseCode,
                style: Get.theme.textTheme.labelLarge!,
              ),
              const SizedBox(height: 8),
              Text(
                '${clazz.from} - ${clazz.to}',
                style: Get.theme.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? secondaryDark : secondaryLight,
                ),
              ),
              Text(
                clazz.professor.toUpperCase(),
                style: Get.theme.textTheme.button,
              ),
            ],
          ),
          Positioned(
            right: 5,
            bottom: 10,
            child: Text(
              'H-301-EAST',
              style: Get.theme.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white38 : Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}

// return ListTile(
                          
//                           title:
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: const [Text('5222')],
//                           ),
//                         );
                      