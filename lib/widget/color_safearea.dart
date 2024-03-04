import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/color_theme.dart';

class ColorSafeArea extends StatelessWidget {
  const ColorSafeArea({super.key, this.color, required this.child});

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color ?? AppThemeColor.primary,
      child: SafeArea(
        child: Container(color: AppThemeColor.com1, child: child),
      ),
    );
  }
}
