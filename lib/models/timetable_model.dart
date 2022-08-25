class TimetableModel {
  Weekday monday;
  Weekday tuesday;
  Weekday wednesday;
  Weekday thursday;
  Weekday friday;

  TimetableModel({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });

  TimetableModel.fromJson(Map<String, dynamic> json)
      : monday = Weekday.fromJson(json['Monday']),
        tuesday = Weekday.fromJson(json['Tuesday']),
        wednesday = Weekday.fromJson(json['Wednesday']),
        thursday = Weekday.fromJson(json['Thursday']),
        friday = Weekday.fromJson(json['Friday']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Monday'] = monday.toJson();
    data['Tuesday'] = tuesday.toJson();
    data['Wednesday'] = wednesday.toJson();
    data['Thursday'] = thursday.toJson();
    data['Friday'] = friday.toJson();
    return data;
  }

  Weekday getWeekday(int index) {
    switch (index) {
      case 0:
        return monday;
      case 1:
        return tuesday;
      case 2:
        return wednesday;
      case 3:
        return thursday;
      case 4:
        return friday;
      default:
        return monday;
    }
  }
}

class Weekday {
  List<Class>? classes;

  Weekday({this.classes});

  Weekday.fromJson(Map<String, dynamic> json) {
    if (json['Classes'] != null) {
      classes = <Class>[];
      json['Classes'].forEach((v) {
        classes?.add(Class.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (classes != null) {
      data['Classes'] = classes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Class {
  final String courseName;
  final String courseCode;
  final String professor;
  final String from;
  final String to;

  Class({
    required this.courseName,
    required this.courseCode,
    required this.professor,
    required this.from,
    required this.to,
  });

  Class.fromJson(Map<String, dynamic> json)
      : courseName = json['Course Name'],
        courseCode = json['Course Code'],
        professor = json['Professor'],
        from = json['From'],
        to = json['To'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Course Name'] = courseName;
    data['Course Code'] = courseCode;
    data['Professor'] = professor;
    data['From'] = from;
    data['To'] = to;
    return data;
  }
}
