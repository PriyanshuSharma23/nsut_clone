import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsutx/widgets/date_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double avatarRadius = screenWidth / 6;
    double heroSectionHeight = screenHeight / 3;

    return Scaffold(
      drawer: const Drawer(),
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
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: heroSectionHeight - avatarRadius,
            left: (screenWidth) * 0.5 - avatarRadius,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundImage: const AssetImage('assets/avatar.png'),
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
