import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';

class Selector extends StatefulWidget {
  final int itemsLength;
  final Function onItemSelected;
  final List<Widget> items;
  final int selectedIndex;

  const Selector({
    Key? key,
    required this.itemsLength,
    required this.onItemSelected,
    required this.items,
    this.selectedIndex = 0,
    // required this.selectedIndex,
  }) : super(key: key);

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < widget.itemsLength; i++)
          GestureDetector(
            onTap: () {
              widget.onItemSelected(i);
            },
            child: SelectorItem(
              isSelected: i == widget.selectedIndex,
              child: widget.items.elementAt(i),
            ),
          ),
      ],
    );
  }
}

class SelectorItem extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  const SelectorItem({
    Key? key,
    required this.isSelected,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;
    final primary = isDark ? primaryDark : primaryLight;
    final secondary = isDark ? secondaryDark : secondaryLight;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 50,
      height: 25,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? secondary : primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (!isSelected)
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.6)
                  : Colors.grey.withOpacity(0.3),
              offset: const Offset(2, 8),
              blurRadius: 20,
              spreadRadius: 1,
            ),
        ],
      ),
      margin:
          isSelected ? const EdgeInsets.only(left: 8) : const EdgeInsets.all(0),
      child: Center(child: child),
    );
  }
}
