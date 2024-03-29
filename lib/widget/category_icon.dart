import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.icon,
    required this.color,
    this.active = true,
  });

  final IconData icon;
  final Color color;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: active == true
            ? color
            : Color.fromRGBO(color.red, color.green, color.blue, 0.2),
        border: Border.all(
          color: active == true
              ? color
              : Color.fromRGBO(color.red, color.green, color.blue, 0.2),
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
            color: active == true
                ? Colors.white
                : Color.fromRGBO(color.red, color.green, color.blue, 0.4),
            size: 18,
          ),
        ),
      ),
    );
  }
}
