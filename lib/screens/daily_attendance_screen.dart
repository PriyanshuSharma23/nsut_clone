import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/models/course.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/class_counter.dart';
import 'package:nsutx/utils/words_util.dart';
import 'package:nsutx/widgets/elevated_container.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class DailyAttendanceScreen extends StatelessWidget {
  DailyAttendanceScreen({
    Key? key,
  }) : super(key: key);

  final course = Get.arguments[0] as Course;

  @override
  Widget build(BuildContext context) {
    final tally = classStats(course);

    final percentage = tally['present']! / tally['total']!;

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
      body: ElevatedContainer(
        child: ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                width: Get.width / 2,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: percentage > MIN_ATTENDANCE_PERCENTAGE
                        ? Get.theme.brightness == Brightness.dark
                            ? greenDark
                            : greenLight
                        : Get.theme.brightness == Brightness.dark
                            ? redDark
                            : redLight,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Attended ${tally['present']!.toInt()} out of ${tally['total']!.toInt()}",
                  style: Get.theme.textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            return BandCard(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      course.attendance.reversed.elementAt(index - 1).date,
                      style: Get.theme.textTheme.headline6,
                    ),
                    Row(
                      children: course.attendance.reversed
                          .elementAt(index - 1)
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
          itemCount: course.attendance.length + 1,
        ),
      ),
    );
  }
}
