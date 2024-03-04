import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/create_task_screen.dart';
import 'package:flutter_todo_app/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'models/category.dart';

final List<Category> categories = [
  Category(id: 1, icon: Icons.accessible, color: Colors.greenAccent),
  Category(id: 2, icon: Icons.ad_units_sharp, color: Colors.amberAccent),
  Category(id: 3, icon: Icons.camera_alt_rounded, color: Colors.grey),
  Category(id: 4, icon: Icons.home, color: Colors.purpleAccent),
  Category(id: 5, icon: Icons.star, color: Colors.orangeAccent),
  Category(id: 6, icon: Icons.calendar_month, color: Colors.blueAccent),
  Category(id: 7, icon: Icons.mail, color: Colors.redAccent),
  Category(id: 8, icon: Icons.man, color: Colors.lightGreen),
  Category(id: 9, icon: Icons.question_answer, color: Colors.lightBlueAccent),
];

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: HomeScreen.builder,
    ),
    GoRoute(
      path: '/create-task',
      builder: CreateTaskScreen.builder,
    ),
  ],
);
