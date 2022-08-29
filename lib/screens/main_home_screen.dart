import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/attendance_controller.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/class_counter.dart';
import 'package:nsutx/widgets/circle_avatar.dart';
import 'package:nsutx/widgets/date_widget.dart';
import 'package:nsutx/widgets/home_drawer.dart';
import 'package:nsutx/widgets/icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  final double heroSectionHeight = Get.height / 3;

  final double avatarRadius = Get.width / 6;

  final double screenWidth = Get.width;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final _attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;

    return Scaffold(
      key: _key,
      drawer: HomeDrawer(
        avatarRadius: avatarRadius,
        screenHeight: Get.height,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: heroSectionHeight,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/hero_section.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Date(),
                      Text(
                        'Semester-3',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                      ),
                      decoration: BoxDecoration(
                          color: isDark ? primaryDark : primaryLight,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ]),
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            final course = _attendanceController.courses[index];
                            final tally = classStats(course);
                            final percentage =
                                tally['present']! / tally['total']!;

                            final red = isDark ? redDark : redLight;
                            final green = isDark ? greenDark : greenLight;
                            return Container(
                              constraints: BoxConstraints(
                                maxWidth: screenWidth / 3,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    '/daily_attendance',
                                    arguments: [course],
                                  );
                                },
                                child: Column(
                                  children: [
                                    CircularPercentIndicator(
                                      animation: true,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      startAngle: 220,
                                      radius: 40,
                                      lineWidth: 5,
                                      percent: percentage *
                                          (7 / 9), // 7/9 to make it an arc
                                      center: Text(
                                        '${(percentage * 100).toStringAsFixed(2)}%',
                                        style: Get.theme.textTheme.bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      progressColor: percentage >=
                                              MIN_ATTENDANCE_PERCENTAGE
                                          ? green
                                          : red,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Text(
                                      course.courseCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      course.courseName,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          itemCount: _attendanceController.courses.length,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 20,
                    runSpacing: 20,
                    children: actions
                        .map((item) => CircleIcon(
                              nameIcon: item,
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
            // avatar image
            Positioned(
              top: heroSectionHeight - avatarRadius,
              left: (screenWidth) * 0.5 - avatarRadius,
              child: Avatar(avatarRadius: avatarRadius),
            ),
            // drawer opener
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
