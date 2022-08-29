import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelInputField extends StatelessWidget {
  const LabelInputField({
    Key? key,
    required this.activeColor,
    required this.label,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final Color activeColor;
  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Text(label, style: Get.theme.textTheme.bodyLarge!),
        ),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.95,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                // vertical: 8.0,
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: hintText,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: activeColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
