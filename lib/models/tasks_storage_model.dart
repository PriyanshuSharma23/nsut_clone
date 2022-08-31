import 'package:flutter/material.dart';
import 'package:nsutx/models/task_model.dart';

class TaskStorageModel {
  Map<DateTime, List<Task>> tasks = {};

  TaskStorageModel();

  List<Task> getTasks(DateTime date) {
    return tasks[date] ?? [];
  }

  double toDouble(TimeOfDay time) {
    return time.hour + time.minute / 60;
  }

  void addTask(Task task) {
    if (!tasks.containsKey(task.date)) {
      tasks[task.date] = [];
      tasks[task.date]?.add(task);
      return;
    }

    for (int i = 0; i < tasks[task.date]!.length; i++) {
      if (tasks[task.date]![i].id == task.id) {
        tasks[task.date]![i] = task;
        return;
      }

      if (toDouble(task.startTime) < toDouble(tasks[task.date]![i].startTime)) {
        tasks[task.date]!.insert(i, task);
        return;
      }
    }

    tasks[task.date]!.add(task);
  }

  void removeTask(Task task) {
    tasks[task.date]!.removeWhere((t) => t.id == task.id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    tasks.forEach((key, value) {
      data[key.toString()] = value.map((e) => e.toJson()).toList();
    });
    return data;
  }

  factory TaskStorageModel.fromJson(Map<String, dynamic> json) {
    final Map<DateTime, List<Task>> tasks = {};
    json.forEach((key, value) {
      tasks[DateTime.parse(key)] =
          value.map((e) => Task.fromJson(e as Map<String, dynamic>)).toList();
    });
    return TaskStorageModel()..tasks = tasks;
  }
}
