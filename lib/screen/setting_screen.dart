import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/button.dart';
import 'package:flutter_todo_app/widget/color_safearea.dart';
import 'package:flutter_todo_app/widget/screen/home_screen/app_title.dart';
import 'package:flutter_todo_app/widget/screen/home_screen/todo_list.dart';
import 'package:flutter_todo_app/widget/sub_page_wrap.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends ConsumerWidget {
  static SettingScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SettingScreen();
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubPageWrap(
      title: '設定',
      child: Column(
        children: [
          Text('深色模式'),
          Text('切換語系'),
        ],
      ),
    );
  }
}
