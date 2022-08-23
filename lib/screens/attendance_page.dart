import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/attendance_controller.dart';
import 'package:nsutx/widgets/attendance_card.dart';
import 'package:nsutx/widgets/elevated_container.dart';

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
            )
          ],
        ),
      ),
      body: ElevatedContainer(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed('daily_attendance', arguments: [
                    _attendanceController.courses.elementAt(index)
                  ]);
                },
                child: AttendanceCard(
                  course: _attendanceController.courses.elementAt(index),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
            itemCount: _attendanceController.courses.length,
          ),
        ),
      ),
    );
  }
}
