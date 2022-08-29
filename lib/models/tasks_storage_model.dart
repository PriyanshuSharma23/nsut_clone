import 'package:flutter/material.dart';
import 'package:nsutx/models/task_model.dart';

class TaskStorageModel {
  final Map<DateTime, List<Task>> _tasks = {};

  List<Task> getTasks(DateTime date) {
    return _tasks[date] ?? [];
  }

  double toDouble(TimeOfDay time) {
    return time.hour + time.minute / 60;
  }

  void addTask(Task task) {
    if (!_tasks.containsKey(task.date)) {
      _tasks[task.date] = [];
      _tasks[task.date]?.add(task);
      return;
    }

    for (int i = 0; i < _tasks[task.date]!.length; i++) {
      if (_tasks[task.date]![i].id == task.id) {
        _tasks[task.date]![i] = task;
        return;
      }

      if (toDouble(task.startTime) <
          toDouble(_tasks[task.date]![i].startTime)) {
        _tasks[task.date]!.insert(i, task);
        return;
      }
    }

    _tasks[task.date]!.add(task);
  }

  void removeTask(Task task) {
    _tasks[task.date]!.removeWhere((t) => t.id == task.id);
  }
}
