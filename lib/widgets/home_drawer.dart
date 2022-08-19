import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/widgets/circle_avatar.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

import '../models/name_icon.dart';

final drawerActions = [
  NameIcon(
    name: 'Profile',
    icon: Icons.person,
    to: '/profile',
  ),
  NameIcon(
    name: 'Attendance',
    icon: Icons.person_search_rounded,
    to: '/attendance',
  ),
  NameIcon(
    name: 'Todo',
    icon: Icons.checklist,
    to: '/todo',
  ),
  NameIcon(
    name: 'Time Table',
    icon: Icons.watch_later_outlined,
    to: '/time_table',
  ),
  NameIcon(
    name: 'Notices',
    icon: Icons.notifications_rounded,
    to: '/notices',
  ),
  NameIcon(
    name: 'Syllabus',
    icon: Icons.book_rounded,
    to: '/syllabus',
  ),
  NameIcon(
    name: 'Previous Year Papers',
    icon: Icons.content_paste_outlined,
    to: '/previous_year_papers',
  ),
  NameIcon(
    name: 'Result',
    icon: Icons.bar_chart_rounded,
    to: '/result',
  ),
  NameIcon(
    name: 'Courses',
    icon: Icons.bookmark_border_rounded,
    to: '/courses',
  ),
  NameIcon(
    name: 'Societies',
    icon: Icons.people_outline_rounded,
    to: '/societies',
  ),
  NameIcon(
    name: 'Events',
    icon: Icons.event_note_rounded,
    to: '/events',
  ),
  NameIcon(
    name: 'About Us',
    icon: Icons.info_outline_rounded,
    to: '/about_us',
  ),
];

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

            return GestureDetector(
              onTap: () {
                Get.toNamed(drawerActions[index - 1].to);
              },
              child: BandCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: Text(
                    drawerActions[index - 1].name,
                    style: Get.theme.textTheme.headline6,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: drawerActions.length + 1,
        ),
      ),
    );
  }
}
