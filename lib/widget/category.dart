import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 40,
        height: 40,
        color: color,
        child: Icon(
          icon,
          color: MyTheme.color.com1,
          size: 18,
        ),
      ),
    );
  }
}
