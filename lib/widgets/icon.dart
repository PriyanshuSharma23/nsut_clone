import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  const CircleIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
