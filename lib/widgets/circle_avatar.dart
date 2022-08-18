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
        backgroundColor: Colors.grey,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(avatarRadius),
          child: Image.asset('assets/avatar.jpeg'),
        ),
      ),
    );
  }
}
