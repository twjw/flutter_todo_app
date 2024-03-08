import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/color_theme.dart';

class MyThemeText {
  MyThemeText({required MyThemeColor colors}) {
    medium = TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      color: colors.black,
    );

    title = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      color: colors.black,
    );

    small = TextStyle(
      fontSize: 13,
      decoration: TextDecoration.none,
      color: colors.secondary,
    );
  }

  late TextStyle small;
  late TextStyle title;
  late TextStyle medium;
}
