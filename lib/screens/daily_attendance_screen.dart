import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/course.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/words_util.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class DailyAttendanceScreen extends StatelessWidget {
  DailyAttendanceScreen({
    Key? key,
  }) : super(key: key);

  final course = Get.arguments[0] as Course;

  @override
  Widget build(BuildContext context) {
    var wordsList = wordsGrouper(course.courseName, 2);

    final greenTick = Icon(
      Icons.check,
      size: 30,
      color: Get.theme.brightness == Brightness.dark ? greenDark : greenLight,
    );
    final redCross = Icon(
      Icons.close,
      size: 30,
      color: Get.theme.brightness == Brightness.dark ? redDark : redLight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
            children: wordsList
                .map((word) => Text(word,
                    style: Get.theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)))
                .toList()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return BandCard(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      course.attendance.elementAt(index).date,
                      style: Get.theme.textTheme.headline6,
                    ),
                    Row(
                      children: course.attendance
                          .elementAt(index)
                          .classes
                          .map((attendance) =>
                              attendance.attendanceGiven ? greenTick : redCross)
                          .toList(),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
          itemCount: course.attendance.length,
        ),
      ),
    );
  }
}
