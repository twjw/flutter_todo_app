import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/button.dart';
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
          const DateTitle(),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 56,
                    color: MyTheme.color.primary,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 28, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TodoList(
                        list: Array(1),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '已完成',
                          textAlign: TextAlign.left,
                          style: MyTheme.text.title,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TodoList(
                        list: Array(1),
                        completed: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Button(
              text: '新增事項',
              onPress: () {
                context.push('/create-task');
              },
            ),
          ),
        ],
      ),
    );
  }
}
