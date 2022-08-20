import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/screens/attendance_page.dart';
import 'package:nsutx/screens/main_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a key

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBarPageTransition(
          builder: ((context, index) => getBody(index)),
          currentIndex: _selectedIndex,
          totalLength: 5,
          transitionType: TransitionType.slide,
          transitionDuration: const Duration(milliseconds: 200),
          transitionCurve: Curves.easeInOut,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: bottomActions
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.name,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return MainHomeScreen();
      case 1:
        return AttendancePage();
      case 3:
        return AttendancePage();

      default:
        return MainHomeScreen();
    }
  }
}
