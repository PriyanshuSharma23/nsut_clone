import 'package:flutter/material.dart';

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
            child: widget.items[i],
          ),
      ],
    );
  }
}
