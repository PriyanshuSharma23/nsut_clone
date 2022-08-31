import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/task_controller.dart';
import 'package:nsutx/models/task_model.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: Get.width * 0.15,
        height: Get.width * 0.15,
        constraints: const BoxConstraints(
          minWidth: 60,
          minHeight: 60,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Get.isDarkMode ? secondaryDark : secondaryLight,
            width: 3,
          ),
        ),
        child: Column(children: [
          Text(
            '${task.startTime.hour}:${task.startTime.minute < 10 ? '0' : ''}${task.startTime.minute}',
            style: Get.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('to', style: Get.textTheme.titleSmall!),
          Text(
            '${task.endTime.hour}:${task.endTime.minute < 10 ? '0' : ''}${task.endTime.minute}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ]),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? primaryDark : primaryLight,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode ? Colors.black54 : Colors.grey.shade400,
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: Get.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        task.description == ''
                            ? 'No description...'
                            : task.description as String,
                        style: Get.textTheme.bodyText2!,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 10),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 140),
                            child: Tooltip(
                              message: task.coordinator == ''
                                  ? 'No coordinator'
                                  : task.coordinator as String,
                              child: Text(
                                task.coordinator == ''
                                    ? 'No coordinator'
                                    : task.coordinator as String,
                                style: Get.textTheme.bodyText2!.copyWith(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 10),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 140),
                            child: Tooltip(
                              message: task.location == ''
                                  ? 'No location'
                                  : task.location as String,
                              child: Text(
                                task.location == ''
                                    ? 'No location'
                                    : task.location as String,
                                style: Get.textTheme.bodyText2!.copyWith(),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed('add_task', arguments: [task, null]);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 24,
                        color: Get.isDarkMode ? secondaryDark : secondaryLight,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.find<TaskController>().removeTask(task);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 24,
                        color: Get.isDarkMode ? secondaryDark : secondaryLight,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
