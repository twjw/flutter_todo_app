import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/theme/text_theme.dart';
import 'package:flutter_todo_app/widget/color_safearea.dart';
import 'package:flutter_todo_app/widget/screen/home_screen/date_title.dart';
import 'package:flutter_todo_app/widget/screen/home_screen/todo_list.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorSafeArea(
      child: Column(
        children: [
          DateTitle(),
          Transform.translate(
            offset: const Offset(0, -60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TodoList(
                  list: Array(1),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Completed',
                  style: AppThemeText.medium.copyWith(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TodoList(
                  list: Array(1),
                  completed: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
