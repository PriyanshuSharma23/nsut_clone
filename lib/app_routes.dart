import 'package:get/route_manager.dart';
import 'package:nsutx/screens/home_page.dart';
import 'package:nsutx/screens/profile_page.dart';

final appRoutes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(
    name: '/profile',
    page: () => const ProfilePage(),
  ),
];
