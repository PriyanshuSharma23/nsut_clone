import 'package:flutter/material.dart';
import 'package:nsutx/widgets/not_found_screen_builder.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotFoundScreen(title: 'Courses');
  }
}
