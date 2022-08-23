import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/Controllers/theme_controller.dart';
import 'package:nsutx/constants.dart';
import 'package:nsutx/screens/attendance_page.dart';
import 'package:nsutx/screens/main_home_screen.dart';
import 'package:nsutx/theme/dark_theme.dart';
import 'package:nsutx/theme/light_theme.dart';
import 'package:nsutx/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a key

  int _selectedIndex = 2;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Get.theme.brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
          children: [
            MainHomeScreen(),
            AttendancePage(),
            MainHomeScreen(),
            AttendancePage(),
            MainHomeScreen()
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavyBar(
            backgroundColor: Get.find<ThemeController>().themeData.brightness ==
                    Brightness.dark
                ? primaryDark
                : primaryLight,
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;

                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                // EasyDebounce.debounce(
                //     'change debounce', const Duration(milliseconds: 200), () {
                //   _pageController.animateToPage(index,
                //       duration: const Duration(milliseconds: 300),
                //       curve: Curves.ease);
                // });
              });
            },
            items: bottomActions
                .map(
                  (item) => BottomNavyBarItem(
                    inactiveColor:
                        Get.find<ThemeController>().themeData.brightness ==
                                Brightness.dark
                            ? Colors.white
                            : Colors.black,
                    activeColor: isDark ? secondaryDark : secondaryLight,
                    textAlign: TextAlign.start,
                    icon: Icon(item.icon),
                    title: Text(item.name),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget getBody(int i) {
    switch (i) {
      case 1:
        return AttendancePage();
      case 3:
        return AttendancePage();
      default:
        return MainHomeScreen();
    }
  }
}


// BottomBarPageTransition(
//           builder: (context, index) => getBody(index),
//           currentIndex: _selectedIndex,
//           totalLength: 5,
//           transitionType: TransitionType.fade,
          
//         ),