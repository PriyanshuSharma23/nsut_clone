class TimetableModel {
  Weekday? monday;
  Weekday? tuesday;
  Weekday? wednesday;
  Weekday? thursday;
  Weekday? friday;

  TimetableModel(
      {this.monday, this.tuesday, this.wednesday, this.thursday, this.friday});

  TimetableModel.fromJson(Map<String, dynamic> json)
      : monday =
            json['Monday'] != null ? Weekday.fromJson(json['Monday']) : null,
        tuesday =
            json['Tuesday'] != null ? Weekday.fromJson(json['Tuesday']) : null,
        wednesday = json['Wednesday'] != null
            ? Weekday.fromJson(json['Wednesday'])
            : null,
        thursday = json['Thursday'] != null
            ? Weekday.fromJson(json['Thursday'])
            : null,
        friday =
            json['Friday'] != null ? Weekday.fromJson(json['Friday']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (monday != null) {
      data['Monday'] = monday?.toJson();
    }
    if (tuesday != null) {
      data['Tuesday'] = tuesday?.toJson();
    }
    if (wednesday != null) {
      data['Wednesday'] = wednesday?.toJson();
    }
    if (thursday != null) {
      data['Thursday'] = thursday?.toJson();
    }
    if (friday != null) {
      data['Friday'] = friday?.toJson();
    }
    return data;
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
