import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.avatarRadius,
  }) : super(key: key);

  final double avatarRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/profile');
      },
      child: CircleAvatar(
          radius: avatarRadius,
          backgroundImage: const AssetImage('assets/avatar.png'),
          backgroundColor: Colors.grey),
    );
  }
}
