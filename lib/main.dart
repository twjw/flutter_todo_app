import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/database/app_database.dart';
import 'package:flutter_todo_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDatabase =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
