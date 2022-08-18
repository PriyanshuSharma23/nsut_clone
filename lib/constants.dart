import 'package:flutter/material.dart';
import 'package:nsutx/models/name_icon.dart';

Uri IMS_LOGIN_URL = Uri.parse('https://imsnsit.org/imsnsit/');

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
    to: '/time_table',
  ),
  NameIcon(
    name: 'Syllabus',
    icon: Icons.book_rounded,
    to: '/syllabus',
  ),
  NameIcon(
    name: 'Exam',
    icon: Icons.assignment_turned_in_rounded,
    to: '/exam',
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

// List<NameIcon> actions = [
//   NameIcon(name: 'Profile', icon: Icons.person),
  
  
  
  
  
  
  

  
// ];

// List<NameIcon> actions = [
//   NameIcon(name: 'Profile', icon: Icons.person, to: '/profile'),
//   NameIcon(name: 'Attendance', icon: Icons.person_search_rounded),
//   NameIcon(name: 'Todo', icon: Icons.checklist),
//   NameIcon(name: 'Time Table', icon: Icons.watch_later_outlined),
//   NameIcon(name: 'Syllabus', icon: Icons.book_rounded),
//   NameIcon(name: 'Exam', icon: Icons.document_scanner_rounded),
//   NameIcon(name: 'Result', icon: Icons.bar_chart_rounded),
//   NameIcon(name: 'Courses', icon: Icons.bookmark_border_rounded),
//   NameIcon(name: 'Societies', icon: Icons.people_outline_rounded),
//   NameIcon(name: 'Events', icon: Icons.event_note_rounded),
// ];

