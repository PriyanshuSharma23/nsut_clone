import 'package:nsutx/models/day_attendance.dart';

class Course {
  final String courseCode;
  final String courseName;
  final List<DayAttendance> attendance;

  Course({
    required this.courseCode,
    required this.courseName,
    required this.attendance,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseCode: json['Course Code'],
      courseName: json['Course Name'],
      attendance: (json['Attendance'] as List)
          .map((e) => DayAttendance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Course_Code': courseCode,
      'Course_Name': courseName,
      'Attendance': attendance.map((e) => e.toMap()).toList(),
    };
  }
}
