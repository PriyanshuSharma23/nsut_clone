import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/widgets/circle_avatar.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class HomeDrawer extends StatelessWidget {
  final double avatarRadius;
  final double screenHeight;
  HomeDrawer({
    Key? key,
    required this.avatarRadius,
    required this.screenHeight,
  }) : super(key: key);

  final _profileController = Get.put(ProfileController());

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
                            _profileController.profileModel.value.studentName
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
                            _profileController.profileModel.value.studentID,
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
