import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/timetable_controller.dart';
import 'package:nsutx/widgets/selector_widget.dart';

class TimeTableScreen extends StatelessWidget {
  TimeTableScreen({Key? key}) : super(key: key);

  final _timetable = Get.put(TimetableController());

  @override
  Widget build(BuildContext context) {
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
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child:
                Selector(itemsLength: 5, onItemSelected: () {}, items: const [
              Text('Mon'),
              Text('Tue'),
              Text('Wed'),
              Text('Thu'),
              Text('Fri'),
            ]),
          ),
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
        ],
      ),
    );
  }
}

// _timetable.timetable.monday.classes.elementAt(0).courseName