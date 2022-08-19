import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/widgets/circle_avatar.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var top = 0.0;

  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = screenWidth / 6;
    final heroSectionHeight = screenHeight / 3;
    final isDark =
        Get.find<ThemeController>().themeData.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            elevation: 2,
            shadowColor: isDark ? Colors.black : Colors.grey,
            backgroundColor: isDark ? primaryDark : Colors.white,
            pinned: true,
            expandedHeight: heroSectionHeight,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              // print('constraints=' + constraints.toString());
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                    opacity: 1.0,
                    child: (top > 100)
                        ? Avatar(avatarRadius: avatarRadius)
                        : Text(
                            'Profile',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? primaryDark.withAlpha(200)
                          : Colors.grey.shade300.withAlpha(200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                  ));
            }),
            actions: [
              IconButton(
                  onPressed: () async {
                    if (!await launchUrl(IMS_LOGIN_URL)) {
                      Get.snackbar(
                        'Error',
                        'Could not launch IMS login page',
                        icon: const Icon(Icons.error),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.open_in_new,
                  ))
            ],
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final entry = _profileController.profileModel.value
                      .toMap()
                      .entries
                      .elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BandCard(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.key,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  Text(
                                    entry.value.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount:
                    _profileController.profileModel.value.toMap().length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
