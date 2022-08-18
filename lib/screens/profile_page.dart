import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/profile_controller.dart';
import 'package:nsutx/widgets/vertical_band_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                        Text(
                          entry.key,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        Text(
                          entry.value.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ]),
                ));
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
      ),
    );
  }
}
