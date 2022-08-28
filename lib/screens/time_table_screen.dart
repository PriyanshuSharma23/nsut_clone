import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/timetable_controller.dart';
import 'package:nsutx/models/timetable_model.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/day.dart';
import 'package:nsutx/widgets/elevated_container.dart';
import 'package:nsutx/widgets/selector_item.dart';
import 'package:nsutx/widgets/selector_widget.dart';
import 'package:nsutx/widgets/time_table_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

const days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
];

class _TimeTableScreenState extends State<TimeTableScreen> {
  final _timetable = Get.put(TimetableController());

  int _index = Day.todaysDayIndex() >= 5 ? 0 : Day.todaysDayIndex();

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Timetable',
          style: Get.theme.textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Selector(
                itemsLength: 5,
                selectedIndex: _index,
                onItemSelected: (int i) {
                  setState(() {
                    _index = i;
                  });
                },
                items: [
                  for (int i = 0; i < 5; i++)
                    SelectorItem(
                      isSelected: i == _index,
                      child: Text(days[i]),
                    ),
                ]),
          ),
          Expanded(
            child: ElevatedContainer(
              child: Obx(
                () => _timetable.timetable.getWeekday(_index).classes == null
                    ? const Text('No timetable')
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            final Class c = _timetable.timetable
                                .getWeekday(_index)
                                .classes!
                                .elementAt(index);
                            return TimelineTile(
                              beforeLineStyle: LineStyle(
                                color: isDark ? Colors.white38 : Colors.black38,
                                thickness: 2,
                              ),
                              afterLineStyle: LineStyle(
                                color: isDark ? Colors.white38 : Colors.black38,
                                thickness: 2,
                              ),
                              lineXY: 1,
                              isFirst: index == 0,
                              isLast: index ==
                                  _timetable.timetable
                                          .getWeekday(_index)
                                          .classes!
                                          .length -
                                      1,
                              indicatorStyle: IndicatorStyle(
                                color: isDark ? secondaryDark : secondaryLight,
                                drawGap: true,
                                width: 15,
                                height: 15,
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, bottom: 16),
                                child: TimeTableTile(clazz: c),
                              ),
                            );
                          },
                          // separatorBuilder: (BuildContext context, int index) {
                          //   return const TimelineDivider(
                          //     begin: 0.1,
                          //     end: 0.9,
                          //     thickness: 6,
                          //     color: Colors.purple,
                          //   );
                          // },
                          itemCount: _timetable.timetable
                              .getWeekday(_index)
                              .classes!
                              .length,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// _timetable.timetable.monday.classes.elementAt(0).courseName
// _timetable.timetable.monday.classes.isEmpty
          //     ? Center(
          //         child: Text(
          //           'No Timetable Found',
          //           style: Get.theme.textTheme.headline6!,
          //         ),
          //       )
          //     : ListView.separated(
          //         itemCount: _timetable.timetable.monday.classes.length,
          //         itemBuilder: (context, index) {
          //           return ListTile(
          //             title: Text(
          //               _timetable.timetable.monday.classes
          //                   .elementAt(index)
          //                   .courseName,
          //               style: Get.theme.textTheme.headline6!,
          //             ),
          //             subtitle: Text(
          //               _timetable.timetable.monday.classes
          //                   .elementAt(index)
          //                   .courseCode,
          //               style: Get.theme.textTheme.headline6!,
          //             ),
          //           );
          //         },
          //         separatorBuilder: (context, index) {
          //           return const Divider();
          //         },
          //       ),