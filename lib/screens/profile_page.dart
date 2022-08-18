import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
              itemBuilder: (BuildContext context, inst index) {},
              separatorBuilder: separatorBuilder,
              itemCount: itemCount)),
    );
  }
}


// var z =  Obx(() => Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: Get.find<ProfileController>()
//                   .profileModel
//                   .value
//                   .toMap()
//                   .entries
//                   .map((e) {
//                 return BandCard(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           e.key,
//                           style:
//                               Theme.of(context).textTheme.headline6!.copyWith(
//                                     fontWeight: FontWeight.w900,
//                                   ),
//                         ),
//                         Text(e.value.toString(),
//                             style: Theme.of(context).textTheme.bodyLarge),
//                       ]),
//                 );
//               }).toList(),
//             ));
      