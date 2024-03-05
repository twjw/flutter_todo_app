import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.icon,
    required this.color,
    this.active = false,
  });

  final IconData icon;
  final Color color;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
        border: Border.all(
          color: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: 38,
          height: 40,
          child: Icon(
            icon,
            color: color,
            size: 18,
          ),
        ),
      ),
    );
  }
}
