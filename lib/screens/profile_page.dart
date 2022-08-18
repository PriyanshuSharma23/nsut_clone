import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/widgets/circle_avtar.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = screenWidth / 6;
    final heroSectionHeight = screenHeight / 3;

    var padding2 = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
        () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final entry = Get.find<ProfileController>()
                  .profileModel
                  .value
                  .toMap()
                  .entries
                  .elementAt(index);
              return BandCard(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        entry.key,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        entry.value.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: Get.find<ProfileController>()
                .profileModel
                .value
                .toMap()
                .length),
      ),
    );
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: heroSectionHeight,
          flexibleSpace: FlexibleSpaceBar(
            title: Avatar(avatarRadius: avatarRadius),
            centerTitle: true,
            background: Container(
              // lighter contrast to the background color and shadow
              decoration: BoxDecoration(
                color: primaryDark.withAlpha(200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.open_in_new,
                ))
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final entry = Get.find<ProfileController>()
                  .profileModel
                  .value
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
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount:
                Get.find<ProfileController>().profileModel.value.toMap().length,
          ),
        ),
      ]),
    );
  }
}
