import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/attendance_controller.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/utils/class_counter.dart';
import 'package:nsutx/widgets/custom_button.dart';
import 'package:nsutx/widgets/elevated_container.dart';

class AttendanceCalculateScreen extends StatefulWidget {
  const AttendanceCalculateScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceCalculateScreen> createState() =>
      _AttendanceCalculateScreenState();
}

class _AttendanceCalculateScreenState extends State<AttendanceCalculateScreen> {
  final _attendanceController = Get.put(AttendanceController());

  String _selectedCourse = 'none';

  int remainingClasses = 0;
  int finalPercentage = 0;

  final formControl = TextEditingController();

  @override
  void dispose() {
    formControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tally = _selectedCourse != 'none'
        ? classStats(_attendanceController.courses
            .firstWhere((element) => element.courseCode == _selectedCourse))
        : {'present': 0, 'absent': 0, 'total': 0};
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance Calculator',
          style: Get.theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ElevatedContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Get.isDarkMode ? primaryDark : primaryLight,
                  value: _selectedCourse,
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      alignment: Alignment.center,
                      value: 'none',
                      child: Text(
                        '--Select your Course--',
                        style: Get.theme.textTheme.bodyMedium,
                      ),
                    ),
                    for (final course in _attendanceController.courses)
                      DropdownMenuItem(
                        value: course.courseCode,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            course.courseName,
                            style: Get.theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                  ],
                  onChanged: (String? s) {
                    setState(() {
                      _selectedCourse = s!;
                    });
                  }),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Text(
                    'Total Classes Till Date: ${tally["total"]?.toInt().toString() ?? "0"}',
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  Text(
                    'Total Classes Attended Till Date: ${tally["present"]?.toInt().toString() ?? "0"}',
                    style: Get.theme.textTheme.titleMedium,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  Text(
                    'Classes Remaining:',
                    style: Get.theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        remainingClasses.toString(),
                        style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? secondaryDark
                                : secondaryLight),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'More Classes',
                        style: Get.theme.textTheme.titleLarge!,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Slider(
                value: remainingClasses.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    remainingClasses = value.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Text(
                    'Final Percentage:',
                    style: Get.theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$finalPercentage%',
                    style: Get.theme.textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? secondaryDark : secondaryLight),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Slider(
                value: finalPercentage.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    finalPercentage = value.toInt();
                  });
                },
                min: 0,
                max: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode ? buttonDark : buttonLight,
                  ),
                  child: Text(
                    'Attend ${remainClassAttend(remainingClasses + tally['total']!, tally['present']!, finalPercentage)} of $remainingClasses to maintain above $finalPercentage% and above',
                    style: Get.theme.textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Get.isDarkMode
                            ? Colors.black45
                            : Colors.grey.shade400,
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                    color: Get.isDarkMode ? primaryDark : primaryLight,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          'Classes to Attend: ',
                          style: Get.theme.textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              ),
                            ],
                            controller: formControl,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomButton(
                            onPressed: () async {
                              final totalClasses =
                                  tally['total']! + remainingClasses;
                              final int toAttend = formControl.text.isEmpty
                                  ? 0
                                  : int.parse(formControl.text);
                              final present = tally['present']! + toAttend;
                              final percentage = (present / totalClasses) * 100;

                              if (remainingClasses < toAttend) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                            'You can\'t enter more than the remaining of classes'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              'OK',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: IntrinsicHeight(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Final Percentage: ${(percentage).toStringAsFixed(2)}',
                                            ),
                                            if (percentage < 75)
                                              const SizedBox(
                                                height: 8,
                                              ),
                                            if (percentage < 75)
                                              const Text(
                                                  'Less than 75% attendance!')
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'OK',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            text: 'Calculate')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
