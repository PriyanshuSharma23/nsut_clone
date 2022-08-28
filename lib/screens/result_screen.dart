import 'package:flutter/material.dart';
import 'package:nsutx/widgets/not_found_screen_builder.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotFoundScreen(title: 'Result');
  }
}
