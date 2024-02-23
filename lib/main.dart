import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/database/app_database.dart';
import 'package:flutter_todo_app/injection.dart';
import 'package:flutter_todo_app/screen/create_task_screen.dart';
import 'package:flutter_todo_app/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() async {
  appDatabase =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
