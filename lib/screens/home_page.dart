import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/constants.dart';

import 'package:nsutx/widgets/date_widget.dart';
import 'package:nsutx/widgets/icon.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

import '../widgets/circle_avatar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double avatarRadius = screenWidth / 6;
    double heroSectionHeight = screenHeight / 3;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: HomeDrawer(
          avatarRadius: avatarRadius,
          screenHeight: screenHeight,
        ),
        body: Stack(
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  final double avatarRadius;
  final double screenHeight;
  const HomeDrawer({
    Key? key,
    required this.avatarRadius,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(
                height: screenHeight / 3,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Avatar(
                            avatarRadius: avatarRadius,
                          ),
                        ),
                        Obx(
                          () => Text(
                            Get.find<ProfileController>()
                                .profileModel
                                .value
                                .studentName
                                .toUpperCase(),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Text(
                            Get.find<ProfileController>()
                                .profileModel
                                .value
                                .studentID,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Get.find<ThemeController>().toggleTheme();
                      },
                      icon: Get.theme.brightness == Brightness.dark
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode),
                    ),
                  ),
                ]),
              );
            }

            return BandCard(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(actions[index - 1].to);
                },
                child: Text(
                  actions[index - 1].name,
                  style: Get.theme.textTheme.headline6,
                ),
              ),
            ));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: actions.length + 1,
        ),
      ),
    );
  }
}
