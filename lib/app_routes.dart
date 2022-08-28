import 'package:get/route_manager.dart';
import 'package:nsutx/screens/attendance_calculate_screen.dart';
import 'package:nsutx/screens/attendance_page.dart';
import 'package:nsutx/screens/daily_attendance_screen.dart';
import 'package:nsutx/screens/home_page.dart';
import 'package:nsutx/screens/notices_screen.dart';
import 'package:nsutx/screens/profile_page.dart';
import 'package:nsutx/screens/syllabus_branch_screen.dart';
import 'package:nsutx/screens/syllabus_screen.dart';
import 'package:nsutx/screens/time_table_screen.dart';
import 'package:nsutx/screens/todo_screen.dart';

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
  ),
  GetPage(
    name: '/timetable',
    page: () => const TimeTableScreen(),
  ),
  GetPage(
    name: '/todo',
    page: () => const TodoScreen(),
  ),
  GetPage(
    name: '/attendance_calculate',
    page: () => const AttendanceCalculateScreen(),
  ),
  GetPage(
    name: '/notices',
    page: () => const NoticesScreen(),
  ),
  GetPage(
    name: '/syllabus',
    page: () => const SyllabusScreen(),
  ),
  GetPage(
    name: '/syllabus_branch',
    page: () => const SyllabusBranchScreen(),
  ),
];
