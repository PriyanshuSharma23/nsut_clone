import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/models/task_model.dart';
import 'package:nsutx/utils/day.dart';

class TaskController extends GetxController {
  // final map = TaskStorageModel().obs;

  late Worker worker;

  @override
  void onInit() {
    super.onInit();

    worker = ever(tasks, (value) {
      print('something changed');
    });
  }

  RxMap<String, RxList<Task>> tasks = <String, RxList<Task>>{}.obs;

  void addTask(Task task) {
    if (!tasks.containsKey(dateToString(task.date))) {
      tasks[dateToString(task.date)] = RxList.empty(growable: true);
      tasks[dateToString(task.date)]?.add(task);
      tasks = RxMap.of(tasks);
      return;
    }

    for (int i = 0; i < tasks[dateToString(task.date)]!.length; i++) {
      if (tasks[dateToString(task.date)]![i].id == task.id) {
        tasks[dateToString(task.date)]![i] = task;

        tasks[dateToString(task.date)] =
            RxList.of(tasks[dateToString(task.date)]!);

        return;
      }

      if (toDouble(task.startTime) <
          toDouble(tasks[dateToString(task.date)]![i].startTime)) {
        tasks[dateToString(task.date)]!.insert(i, task);
        tasks[dateToString(task.date)] =
            RxList.of(tasks[dateToString(task.date)]!);
        return;
      }
    }

    tasks[dateToString(task.date)]!.add(task);
    tasks[dateToString(task.date)] = RxList.of(tasks[dateToString(task.date)]!);
  }

  void removeTask(Task task) {
    tasks[dateToString(task.date)]!.removeWhere((t) => t.id == task.id);
    tasks[dateToString(task.date)] = RxList.of(tasks[dateToString(task.date)]!);
  }

  double toDouble(TimeOfDay time) {
    return time.hour + time.minute / 60;
  }

  RxList<Task> getTasks(DateTime date) {
    return tasks[dateToString(date)] ?? RxList.empty(growable: true);
  }
}
