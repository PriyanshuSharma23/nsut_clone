import 'package:nsutx/models/attendance_model.dart';

class DayAttendance {
  final String date;
  final List<Class> classes;

  DayAttendance({
    required this.date,
    required this.classes,
  });

  factory DayAttendance.fromJson(Map<String, dynamic> json) {
    return DayAttendance(
      date: json['Date'],
      classes: (json['Classes'] as List)
          .map((e) => Class.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Date': date,
      'Classes': classes.map((e) => e.toMap()).toList(),
    };
  }
}
