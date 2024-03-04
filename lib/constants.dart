import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/create_task_screen.dart';
import 'package:flutter_todo_app/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'models/category.dart';

final List<Category> categories = [
  Category(id: 1, iconData: Icons.factory, color: Colors.greenAccent),
  Category(id: 2, iconData: Icons.factory, color: Colors.amberAccent),
  Category(id: 3, iconData: Icons.factory, color: Colors.grey),
  Category(id: 4, iconData: Icons.factory, color: Colors.purpleAccent),
  Category(id: 5, iconData: Icons.factory, color: Colors.orangeAccent),
  Category(id: 6, iconData: Icons.factory, color: Colors.blueAccent),
  Category(id: 7, iconData: Icons.factory, color: Colors.redAccent),
  Category(id: 8, iconData: Icons.factory, color: Colors.lightGreen),
  Category(id: 9, iconData: Icons.factory, color: Colors.lightBlueAccent),
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
