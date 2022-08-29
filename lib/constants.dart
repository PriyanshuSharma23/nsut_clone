import 'package:flutter/material.dart';
import 'package:nsutx/models/name_icon.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

// ignore: non_constant_identifier_names
Uri IMS_LOGIN_URL = Uri.parse('https://imsnsit.org/imsnsit/');

// ignore: constant_identifier_names
const MIN_ATTENDANCE_PERCENTAGE = 0.75;

final drawerActions = [
  NameIcon(
    name: 'Profile',
    icon: Icons.person,
    to: '/profile',
  ),
  NameIcon(
    name: 'Attendance',
    icon: Icons.person_search_rounded,
    to: '/attendance',
  ),
  NameIcon(
    name: 'Todo',
    icon: Icons.checklist,
    to: '/todo',
  ),
  NameIcon(
    name: 'Time Table',
    icon: Icons.watch_later_outlined,
    to: '/timetable',
  ),
  NameIcon(
    name: 'Notices',
    icon: Icons.notifications_rounded,
    to: '/notices',
  ),
  NameIcon(
    name: 'Syllabus',
    icon: Icons.book_rounded,
    to: '/syllabus',
  ),
  NameIcon(
    name: 'Previous Year Papers',
    icon: Icons.content_paste_outlined,
    to: '/previous_year_papers',
  ),
  NameIcon(
    name: 'Result',
    icon: Icons.bar_chart_rounded,
    to: '/result',
  ),
  NameIcon(
    name: 'Courses',
    icon: Icons.bookmark_border_rounded,
    to: '/courses',
  ),
  NameIcon(
    name: 'Societies',
    icon: Icons.people_outline_rounded,
    to: '/societies',
  ),
  NameIcon(
    name: 'Events',
    icon: Icons.event_note_rounded,
    to: '/events',
  ),
];

List<NameIcon> actions = [
  NameIcon(
    name: 'Profile',
    icon: Icons.person,
    to: '/profile',
  ),
  NameIcon(
    name: 'Attendance',
    icon: Icons.person_search_rounded,
    to: '/attendance',
  ),
  NameIcon(
    name: 'Todo',
    icon: Icons.checklist,
    to: '/todo',
  ),
  NameIcon(
    name: 'Time Table',
    icon: Icons.watch_later_outlined,
    to: '/timetable',
  ),
  NameIcon(
    name: 'Syllabus',
    icon: Icons.book_rounded,
    to: '/syllabus',
  ),
  NameIcon(
    name: 'Previous Year Papers',
    icon: Icons.content_paste_outlined,
    to: '/previous_year_papers',
  ),
  NameIcon(
    name: 'Result',
    icon: Icons.bar_chart_rounded,
    to: '/result',
  ),
  NameIcon(
    name: 'Courses',
    icon: Icons.bookmark_border_rounded,
    to: '/courses',
  ),
  NameIcon(
    name: 'Societies',
    icon: Icons.people_outline_rounded,
    to: '/societies',
  ),
  NameIcon(
    name: 'Events',
    icon: Icons.event_note_rounded,
    to: '/events',
  ),
];

List<NameIcon> bottomActions = [
  NameIcon(
    name: 'Time Table',
    icon: Icons.watch_later_outlined,
    to: '/timetable',
  ),
  NameIcon(
    name: 'Attendance',
    icon: Icons.person_search_rounded,
    to: '/attendance',
  ),
  NameIcon(
    name: 'Home',
    icon: Icons.home,
    to: '/',
  ),
  NameIcon(
    name: 'Todo',
    icon: Icons.checklist,
    to: '/todo',
  ),
  NameIcon(
    name: 'Notices',
    icon: Icons.notifications_rounded,
    to: '/notices',
  ),
];

var uuid = const Uuid(options: {'grng': UuidUtil.cryptoRNG});
