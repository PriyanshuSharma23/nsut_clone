import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nsutx/models/branch_model.dart';
import 'package:nsutx/widgets/elevated_container.dart';

class SyllabusBranchScreen extends StatefulWidget {
  const SyllabusBranchScreen({Key? key}) : super(key: key);

  @override
  State<SyllabusBranchScreen> createState() => _SyllabusBranchScreenState();
}

class _SyllabusBranchScreenState extends State<SyllabusBranchScreen> {
  late Future<void> _loadFuture;

  @override
  void initState() {
    _loadFuture = Future.delayed(const Duration(seconds: 3));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Branch branch = Get.arguments[0] as Branch;
    final int semester = Get.arguments[1] + 1;

    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                branch.code,
                style: Get.theme.textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    branch.name,
                    style: Get.theme.textTheme.headline6!.copyWith(
                      color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Semester $semester',
                    style: Get.theme.textTheme.headline6!.copyWith(
                      color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ElevatedContainer(
            child: Center(
              child: FutureBuilder(
                  future: _loadFuture,
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.done) {
                    //   return Lottie.asset(
                    //     'assets/not_found_lottie.json',
                    //   );
                    // } else {
                    //   return Lottie.asset(
                    //     'assets/searching_lottie.json',
                    //   );
                    // }
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: Lottie.asset(
                        'assets/searching_lottie.json',
                      ),
                      secondChild: Lottie.asset(
                        'assets/not_found_lottie.json',
                      ),
                      crossFadeState:
                          snapshot.connectionState == ConnectionState.done
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }
}
