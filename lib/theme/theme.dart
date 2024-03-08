import 'package:flutter_todo_app/theme/color_theme.dart';
import 'package:flutter_todo_app/theme/text_theme.dart';

class MyTheme {
  MyTheme._();

  static final MyThemeColor color = MyThemeColor();
  static final MyThemeText text = MyThemeText(colors: MyTheme.color);
}
