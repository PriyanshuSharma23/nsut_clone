import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NotFoundScreen> createState() => _NotFoundScreen();
}

class _NotFoundScreen extends State<NotFoundScreen> {
  late Future<void> _loadFuture;

  @override
  void initState() {
    _loadFuture = Future.delayed(const Duration(seconds: 3));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: Get.theme.textTheme.headline1!.copyWith(
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(
        child: FutureBuilder(
            future: _loadFuture,
            builder: (context, snapshot) {
              return AnimatedCrossFade(
                duration: const Duration(milliseconds: 500),
                firstChild: Lottie.asset(
                  'assets/searching_lottie.json',
                ),
                secondChild: Lottie.asset(
                  'assets/not_found_lottie.json',
                ),
                crossFadeState: snapshot.connectionState == ConnectionState.done
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              );
            }),
      ),
    );
  }
}
