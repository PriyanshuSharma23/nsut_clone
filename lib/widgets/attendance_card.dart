import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/models/course.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/class_counter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttendanceCard extends StatefulWidget {
  final Course course;

  const AttendanceCard({Key? key, required this.course}) : super(key: key);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  final Map<String, double> _tally = {};
  @override
  void initState() {
    _tally.addAll(classStats(widget.course));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;
    final green = isDark ? greenDark : greenLight;
    final red = isDark ? redDark : redLight;
    final percentage = _tally['present']! / _tally['total']!;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5,
                    ),
                    child: (percentage >= MIN_ATTENDANCE_PERCENTAGE)
                        ? Text(
                            'Already in safe zone! Take a nap :)',
                            style: Get.theme.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: green,
                            ),
                          )
                        : Text(
                            'You need to attend ${toSafe(_tally['present']!, _tally['total']!)} more classes to be safe!',
                            style: Get.theme.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: red,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: percentage < MIN_ATTENDANCE_PERCENTAGE ? red : green,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.courseCode,
                        style: Get.theme.textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        // add max width
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          widget.course.courseName,
                          style: Get.theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 45,
                    lineWidth: 5,
                    percent: percentage,
                    center: Text(
                      '${(percentage * 100).toStringAsFixed(2)}%',
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    progressColor: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
