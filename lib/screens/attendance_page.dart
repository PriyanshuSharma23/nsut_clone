import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/attendance_controller.dart';

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
      body: Center(
        child: Obx(
          () => Text(
            _attendanceController.courses.length.toString(),
          ),
        ),
      ),
    );
  }
}
