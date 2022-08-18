import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nsutx/Controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double avatarRadius = screenWidth / 4;
    double heroSectionHeight = screenHeight / 3;

    return Scaffold(
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
              TextButton(
                child: const Text('Change Theme'),
                onPressed: () {
                  Get.find<ThemeController>().toggleTheme();
                },
              )
            ],
          ),
          Positioned(
            top: heroSectionHeight - avatarRadius / 2,
            left: (screenWidth - avatarRadius) * 0.5,
            child: Container(
              height: avatarRadius,
              width: avatarRadius,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
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
    );
  }
}
