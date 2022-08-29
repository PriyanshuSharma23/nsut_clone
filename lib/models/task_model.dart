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

  void saveToMemory() {}
}
