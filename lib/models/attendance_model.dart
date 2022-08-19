class Class {
  final bool attendanceGiven;
  final String marked;

  Class({
    required this.attendanceGiven,
    required this.marked,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      attendanceGiven: json['Attendance_Given'],
      marked: json['Marked'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Attendance_Given': attendanceGiven,
      'Marked': marked,
    };
  }
}
