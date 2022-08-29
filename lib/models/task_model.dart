import 'package:flutter/material.dart';

final taskCategories = [
  'Test',
  'Meet',
  'Assignment',
  'Class',
  'Others',
];

enum TaskCategory {
  test,
  meet,
  assignment,
  classTask,
  others,
}

TaskCategory stringToEnumTask(String value) {
  switch (value) {
    case 'Test':
      return TaskCategory.test;
    case 'Meet':
      return TaskCategory.meet;
    case 'Assignment':
      return TaskCategory.assignment;
    case 'Class':
      return TaskCategory.classTask;
    case 'Others':
      return TaskCategory.others;
    default:
      return TaskCategory.others;
  }
}

class Task {
  TaskCategory category;
  String title;
  String? description;
  String? coordinator;
  String? location;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  bool notifications;
  final String id;

  Task({
    required this.category,
    required this.title,
    this.description,
    this.coordinator,
    this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.notifications,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category.toString(),
      'title': title,
      'description': description,
      'coordinator': coordinator,
      'location': location,
      'date': date.toIso8601String(),
      'startTime': Date.fromTimeOfDate(startTime).toJson(),
      'endTime': Date.fromTimeOfDate(endTime).toJson(),
      'notifications': notifications,
      'id': id,
    };
  }

  printTask() {
    print(
        'category: $category, title: $title, description: $description, coordinator: $coordinator, location: $location, date: $date, startTime: $startTime, endTime: $endTime, notifications: $notifications, id: $id');
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      category: stringToEnumTask(json['category'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      coordinator: json['coordinator'] as String?,
      location: json['location'] as String?,
      date: DateTime.parse(json['date'] as String),
      //TODO: fix this
      startTime: Date.fromJson(json['startTime'] as Map<String, dynamic>)
          .toTimeOfDay(),
      endTime:
          Date.fromJson(json['endTime'] as Map<String, dynamic>).toTimeOfDay(),
      notifications: json['notifications'] as bool,
      id: json['id'] as String,
    );
  }
}

class Date {
  final int hour;
  final int min;

  Date({
    required this.hour,
    required this.min,
  });

  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'min': min,
    };
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: min);
  }

  factory Date.fromTimeOfDate(TimeOfDay time) {
    return Date(
      hour: time.hour,
      min: time.minute,
    );
  }

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      hour: json['hour'] as int,
      min: json['min'] as int,
    );
  }
}
