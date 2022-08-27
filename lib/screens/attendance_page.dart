import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/attendance_controller.dart';
import 'package:nsutx/widgets/attendance_card.dart';
import 'package:nsutx/widgets/custom_button.dart';

class AttendancePage extends StatelessWidget {
  AttendancePage({Key? key}) : super(key: key);

  final _attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Attendance',
              style: Get.theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Semester 3',
              style: Get.theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        Get.toNamed('/attendance_calculate');
                      },
                      text: 'Attendance Calculator',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          Get.toNamed('daily_attendance', arguments: [
                            _attendanceController.courses.elementAt(index)
                          ]);
                        },
                        child: Column(
                          children: [
                            AttendanceCard(
                              course: _attendanceController.courses
                                  .elementAt(index),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ));
                },
                childCount: _attendanceController.courses.length,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
