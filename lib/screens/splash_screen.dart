import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/screens/home_page.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class InitialSplashScreen extends StatefulWidget {
  const InitialSplashScreen({Key? key}) : super(key: key);

  @override
  State<InitialSplashScreen> createState() => _InitialSplashScreenState();
}

class _InitialSplashScreenState extends State<InitialSplashScreen> {
  late Future next;

  @override
  void initState() {
    next = Future.delayed(const Duration(seconds: 2), () {
      Get.to(const HomePage());
    });
    super.initState();
  }

  @override
  void dispose() {
    next = Future.value();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'NSUTX',
                    style: Get.isDarkMode
                        ? Theme.of(context).textTheme.headline1!.copyWith(
                              color: secondaryDark,
                              fontWeight: FontWeight.bold,
                            )
                        : Theme.of(context).textTheme.headline1!.copyWith(
                              color: secondaryLight,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 250,
                    ),
                    child: Text(
                      'One stop solution for all your college needs',
                      textAlign: TextAlign.center,
                      style: Get.isDarkMode
                          ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: secondaryDark,
                              )
                          : Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: secondaryLight,
                              ),
                    ),
                  ),
                ],
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     Get.offAll(() => const HomePage());
              //   },
              //   child: const Text('Get Started'),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  'assets/nsut_logo.png',
                  width: Get.width * 0.5,
                  height: Get.width * 0.5,
                ),
              ),

              CircularProgressIndicator(
                color: Get.isDarkMode ? secondaryDark : secondaryLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
