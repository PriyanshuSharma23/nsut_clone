import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/widgets/circle_avatar.dart';
import 'package:nsutx/widgets/date_widget.dart';
import 'package:nsutx/widgets/home_drawer.dart';
import 'package:nsutx/widgets/icon.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({
    Key? key,
  }) : super(key: key);

  final double heroSectionHeight = Get.height / 3;
  final double avatarRadius = Get.width / 6;
  final double screenWidth = Get.width;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: HomeDrawer(
        avatarRadius: avatarRadius,
        screenHeight: Get.height,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: heroSectionHeight,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/hero_section.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Date(),
                      Text(
                        'Semester-3',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 20,
                    runSpacing: 20,
                    children: actions
                        .map((item) => CircleIcon(
                              nameIcon: item,
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
            // avatar image
            Positioned(
              top: heroSectionHeight - avatarRadius,
              left: (screenWidth) * 0.5 - avatarRadius,
              child: Avatar(avatarRadius: avatarRadius),
            ),
            // drawer opener
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
