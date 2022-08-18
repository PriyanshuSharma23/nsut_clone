import 'package:flutter/material.dart';
import 'package:nsutx/constants.dart';

import 'package:nsutx/widgets/date_widget.dart';
import 'package:nsutx/widgets/icon.dart';

import '../widgets/circle_avatar.dart';
import '../widgets/theme_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double avatarRadius = screenWidth / 6;
    double heroSectionHeight = screenHeight / 3;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: HomeDrawer(
          avatarRadius: avatarRadius,
        ),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: heroSectionHeight,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/hero_section.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Date(),
                      Text(
                        'Semester-3',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 20,
                    runSpacing: 20,
                    children: actions
                        .map((item) => CircleIcon(
                              nameIcon: item,
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
            // avatar image
            Positioned(
              top: heroSectionHeight - avatarRadius,
              left: (screenWidth) * 0.5 - avatarRadius,
              child: Avatar(avatarRadius: avatarRadius),
            ),
            // drawer opener
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  final double avatarRadius;
  const HomeDrawer({
    Key? key,
    required this.avatarRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Center(
            child: Avatar(avatarRadius: avatarRadius),
          ),
          Column(
            children: const [],
          ),
          // theme changing button
          const Positioned(child: ThemeButton()),
        ],
      ),
    );
  }
}
