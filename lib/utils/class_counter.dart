import 'package:nsutx/constants.dart';
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

int toSafe(double present, double total) {
  double extraClasses = (MIN_ATTENDANCE_PERCENTAGE * total - present) /
      (1 - MIN_ATTENDANCE_PERCENTAGE);

  return extraClasses.ceil();
}

// m = (a + x) / (b + x)
// mb + mx = a + x
// mb - a = x*(1 - m)
// x = (mb - a) / (1 - m)

int remainClassAttend(num total, num present, num finalPercentage) {
  // ((remainingClasses + tally['total']!) * finalPercentage ~/ 100 - tally['present']!).toInt().toString()
  final n = ((total) * finalPercentage ~/ 100 - present).toInt();

  return n < 0 ? 0 : n;
}
