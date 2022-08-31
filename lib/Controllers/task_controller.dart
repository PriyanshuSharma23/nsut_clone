import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/task_model.dart';
import 'package:nsutx/utils/day.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskController extends GetxController {
  // final map = TaskStorageModel().obs;

  late Worker worker;
  RxMap<String, RxList<Task>> tasks = <String, RxList<Task>>{}.obs;

  @override
  void onInit() async {
    super.onInit();

    await read();
  }

  Future saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', json.encode(tasks));
  }

  Future<void> read({String key = 'tasks'}) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getString(key);
    if (tasks != null) {
      this.tasks.value = (json.decode(tasks) as Map<String, dynamic>).map(
          (key, value) => MapEntry(
              key,
              RxList<Task>.from((value as List<dynamic>)
                  .map((task) => Task.fromJson(task))
                  .toList())));
    }
  }

  void addTask(Task task) async {
    if (!tasks.containsKey(dateToString(task.date))) {
      tasks[dateToString(task.date)] = RxList.empty(growable: true);
      tasks[dateToString(task.date)]?.add(task);
      tasks = RxMap.of(tasks);

      await saveTasks();
      return;
    }

    for (int i = 0; i < tasks[dateToString(task.date)]!.length; i++) {
      if (tasks[dateToString(task.date)]![i].id == task.id) {
        tasks[dateToString(task.date)]![i] = task;

        tasks[dateToString(task.date)] =
            RxList.of(tasks[dateToString(task.date)]!);

        await saveTasks();
        return;
      }

      if (toDouble(task.startTime) <
          toDouble(tasks[dateToString(task.date)]![i].startTime)) {
        tasks[dateToString(task.date)]!.insert(i, task);
        tasks[dateToString(task.date)] =
            RxList.of(tasks[dateToString(task.date)]!);

        await saveTasks();
        return;
      }
    }

    tasks[dateToString(task.date)]!.add(task);
    tasks[dateToString(task.date)] = RxList.of(tasks[dateToString(task.date)]!);
    await saveTasks();
  }

  void removeTask(Task task) {
    tasks[dateToString(task.date)]!.removeWhere((t) => t.id == task.id);
    tasks[dateToString(task.date)] = RxList.of(tasks[dateToString(task.date)]!);
  }

  double toDouble(TimeOfDay time) {
    return time.hour + time.minute / 60;
  }

  RxList<Task> getTasks(
    DateTime date, {
    TaskCategory? taskCategory,
  }) {
    if (tasks[dateToString(date)] == null) {
      return RxList.empty(growable: true);
    }
    taskCategory ??= TaskCategory.all;
    final filteredList = tasks[dateToString(date)]!;

    final newList = [];
    if (taskCategory != TaskCategory.all) {
      for (final l in filteredList) {
        if (l.category == taskCategory) {
          newList.add(l);
        }
      }

      return RxList.from(newList);
    }

    return RxList.from(filteredList);
  }

  String toJson() {
    return json.encode(tasks);
  }

  RxMap<String, RxList<Task>> fromJson(String json) {
    return jsonDecode(json);
  }
}
