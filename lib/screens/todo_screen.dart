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
import 'package:table_calendar/table_calendar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TaskController _taskController = Get.put(TaskController());
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
                  Get.toNamed('add_task');
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
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
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
              titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
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
              todayDecoration: BoxDecoration(
                color: Get.isDarkMode ? secondaryDark : secondaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Stack(children: [
              ElevatedContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/no_task_lottie.json",
                    ),
                    Text(
                      'No Tasks',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
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
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
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
                      PopupMenuItem(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'All tasks',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      for (final task in taskCategories)
                        PopupMenuItem(
                          value: task,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(
                                  task,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
