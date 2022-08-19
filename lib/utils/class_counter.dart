import 'package:nsutx/models/course.dart';

Map<String, double> classStats(Course course) {
  double totalClasses = 0;
  double totalPresent = 0;
  double totalAbsent = 0;

  for (final dayAttendance in course.attendance) {
    for (final classAttendance in dayAttendance.classes) {
      totalClasses++;
      if (classAttendance.attendanceGiven) {
        totalPresent++;
      } else {
        totalAbsent++;
      }
    }
  }

  return {
    'total': totalClasses,
    'present': totalPresent,
    'absent': totalAbsent,
  };
}
