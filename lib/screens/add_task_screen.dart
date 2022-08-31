import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/task_controller.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/models/task_model.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/day.dart';
import 'package:nsutx/widgets/elevated_container.dart';
import 'package:nsutx/widgets/label_input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String selectedCategory = taskCategories[1];

  // textfield controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final coordinatorController = TextEditingController();
  final locationController = TextEditingController(text: 'None');

  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay startTime = TimeOfDay.now();

  // start time + 1 hour
  TimeOfDay endTime = TimeOfDay.now().hour == 23
      ? const TimeOfDay(hour: 23, minute: 59)
      : TimeOfDay(
          hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);

  bool notificationsEnabled = true;

  bool inEditMode = false;
  late String prevId;

  // dispose
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    coordinatorController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void updateEndTime(TimeOfDay startTime) {
    if (startTime.hour == 23) {
      endTime = const TimeOfDay(hour: 23, minute: 59);
    } else {
      endTime = TimeOfDay(
        hour: startTime.hour + 1,
        minute: startTime.minute,
      );
    }
  }

  Task createTask() {
    return Task(
      category: stringToEnumTask(selectedCategory),
      title: titleController.text,
      description: descriptionController.text,
      coordinator: coordinatorController.text,
      location: locationController.text,
      date: selectedDate,
      startTime: startTime,
      endTime: endTime,
      notifications: notificationsEnabled,
      id: inEditMode ? prevId : uuid.v4(),
    );
  }

  void handleDone() {
    if (titleController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a title',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.back();
      Get.snackbar(
        'Success',
        'Task added',
        icon: const Icon(Icons.check),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      );
      // print(createTask().printTask());
      Get.find<TaskController>().addTask(createTask());
    }
  }

  @override
  void initState() {
    // check if argument is a task
    // check if argument is a list
    if (Get.arguments is List) {
      if (Get.arguments[0] is Task) {
        final task = Get.arguments[0] as Task;
        titleController.text = task.title;
        descriptionController.text = task.description ?? '';
        coordinatorController.text = task.coordinator ?? '';
        locationController.text = task.location ?? '';
        selectedCategory = enumToStringTask(task.category);
        selectedDate = task.date;
        startTime = task.startTime;
        endTime = task.endTime;
        notificationsEnabled = task.notifications;
        inEditMode = true;
        prevId = task.id;
      }
      if (Get.arguments[1] is DateTime) {
        selectedDate = Get.arguments[1];
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = Get.isDarkMode ? secondaryDark : secondaryLight;
    final inactiveColor = activeColor.withOpacity(0.4);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Task',
                  style: Get.theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    handleDone();
                  },
                  icon: const Icon(Icons.check),
                  iconSize: 40,
                  color: Get.isDarkMode ? buttonDark : buttonLight,
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedContainer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text('Category',
                          style: Get.theme.textTheme.bodyLarge!),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final category in taskCategories.sublist(1))
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                child: Chip(
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    child: Text(
                                      category,
                                      style: Get.theme.textTheme.titleMedium,
                                    ),
                                  ),
                                  labelStyle: Get.theme.textTheme.bodyLarge!,
                                  backgroundColor: category == selectedCategory
                                      ? activeColor
                                      : inactiveColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LabelInputField(
                      controller: titleController,
                      activeColor: activeColor,
                      label: 'Task Title',
                      hintText: 'Add Title',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LabelInputField(
                      controller: descriptionController,
                      activeColor: activeColor,
                      label: 'Description',
                      hintText: 'Add Description',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LabelInputField(
                      controller: coordinatorController,
                      activeColor: activeColor,
                      label: 'Coordinator',
                      hintText: 'Add Coordinator',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LabelInputField(
                      controller: locationController,
                      activeColor: activeColor,
                      label: 'Location',
                      hintText: 'Add Location',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    var newDate = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    );

                                    if (newDate != null) {
                                      setState(() {
                                        selectedDate = newDate;
                                      });
                                    }
                                  },
                                  child: SelectorButton(
                                    icon: Icons.calendar_today_outlined,
                                    label: 'Date',
                                    value:
                                        '${selectedDate.day} ${months[selectedDate.month]?.substring(0, 3)}',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      notificationsEnabled =
                                          !notificationsEnabled;
                                    });
                                  },
                                  child: SelectorButton(
                                    icon: notificationsEnabled
                                        ? Icons.notifications_active_outlined
                                        : Icons.notifications_off_outlined,
                                    label: 'Notifications',
                                    value: notificationsEnabled ? 'ON' : 'OFF',
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    var newStartTime = await showTimePicker(
                                      context: context,
                                      initialTime: startTime,
                                      initialEntryMode:
                                          TimePickerEntryMode.input,
                                    );

                                    if (newStartTime != null) {
                                      setState(() {
                                        startTime = newStartTime;
                                        updateEndTime(startTime);
                                      });
                                    }
                                  },
                                  child: SelectorButton(
                                    icon: Icons.flag_outlined,
                                    label: 'Start Time',
                                    value: startTime.format(context),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    var newEndTime = await showTimePicker(
                                      context: context,
                                      initialTime: endTime,
                                      initialEntryMode:
                                          TimePickerEntryMode.input,
                                    );

                                    if (newEndTime != null) {
                                      setState(() {
                                        endTime = newEndTime;
                                      });
                                    }
                                  },
                                  child: SelectorButton(
                                    icon: Icons.stop_circle_outlined,
                                    label: 'End Time',
                                    value: endTime.format(context),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectorButton extends StatelessWidget {
  const SelectorButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.isDarkMode ? primaryDark : primaryLight,
        boxShadow: [
          BoxShadow(
            color: Get.isDarkMode ? Colors.black54 : Colors.grey.shade400,
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                label,
                style: Get.theme.textTheme.caption!,
              ),
              Text(
                value,
                style: Get.theme.textTheme.bodyLarge!,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
