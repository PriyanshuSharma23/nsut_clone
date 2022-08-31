import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nsutx/Controllers/task_controller.dart';
import 'package:nsutx/models/task_model.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/day.dart';
import 'package:nsutx/widgets/custom_button.dart';
import 'package:nsutx/widgets/elevated_container.dart';
import 'package:nsutx/widgets/task_card.dart';
import 'package:table_calendar/table_calendar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var _selectedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  TaskCategory? categoryFilter = TaskCategory.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    Day.dayMonth(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                  Text(
                    Day.todaysDay(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {
                  Get.toNamed('add_task', arguments: [null, _selectedDay]);
                },
                text: 'Add Task',
                width: 150,
                radius: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomCalender(
            selectedDay: _selectedDay,
            updateSelectedDay: (DateTime selectedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          Expanded(
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: ElevatedContainer(
                  child: Tasks(
                    selectedDay: _selectedDay,
                    filter: categoryFilter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  // padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? buttonDark : buttonLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: PopupMenuButton(
                    initialValue: categoryFilter,
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                    onSelected: (TaskCategory? category) {
                      setState(() {
                        categoryFilter = category;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: categoryFilter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Show: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      // PopupMenuItem(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'All tasks',
                      //         style: Get.textTheme.titleMedium,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      for (final task in taskCategories)
                        PopupMenuItem(
                          value: stringToEnumTask(task),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(
                                  task,
                                  style: Get.textTheme.titleMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CustomCalender extends StatelessWidget {
  const CustomCalender({
    Key? key,
    required this.selectedDay,
    required this.updateSelectedDay,
  }) : super(key: key);

  final DateTime selectedDay;
  final Function updateSelectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        updateSelectedDay(selectedDay);
      },
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: selectedDay,
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Get.isDarkMode ? secondaryDark : secondaryLight,
          size: 32,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Get.isDarkMode ? secondaryDark : secondaryLight,
          size: 32,
        ),
        titleTextStyle: Get.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        titleCentered: true,
        formatButtonVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? secondaryDark : secondaryLight,
        ),
        weekendStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? secondaryDark : secondaryLight,
        ),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        weekendTextStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        outsideDaysVisible: false,
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        disabledDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        outsideDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        weekendDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        selectedDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Get.isDarkMode ? secondaryDark : secondaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  Tasks({Key? key, required this.selectedDay, this.filter}) : super(key: key);
  final TaskController _taskController = Get.put(TaskController());
  final DateTime selectedDay;
  final TaskCategory? filter;

  @override
  Widget build(BuildContext context) {
    // print(_taskController.getTasks(DateTime(2022, 8, 30)).length);
    // for (final key in _taskController.tasks.keys) {
    //   print('$key:');
    //   for (var element in _taskController.tasks[key]!) {
    //     element.printTask();
    //   }
    // }

    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_taskController
                .getTasks(selectedDay, taskCategory: filter)
                .isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/no_task_lottie.json",
                  ),
                  Text(
                    _taskController.tasks.isEmpty
                        ? 'No Tasks'
                        : 'No task in ${enumToStringTask(filter!)}',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            if (_taskController
                .getTasks(selectedDay, taskCategory: filter)
                .isNotEmpty)
              for (final task in _taskController.getTasks(selectedDay,
                  taskCategory: filter))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TaskCard(
                    task: task,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
