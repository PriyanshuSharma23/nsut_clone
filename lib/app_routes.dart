import 'package:get/route_manager.dart';
import 'package:nsutx/screens/attendance_page.dart';
import 'package:nsutx/screens/daily_attendance_screen.dart';
import 'package:nsutx/screens/home_page.dart';
import 'package:nsutx/screens/profile_page.dart';

final appRoutes = [
  GetPage(
    name: '/',
    page: () => const HomePage(),
  ),
  GetPage(
    name: '/profile',
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: '/attendance',
    page: () => AttendancePage(),
  ),
  GetPage(
    name: '/daily_attendance',
    page: () => DailyAttendanceScreen(),
  )
];
