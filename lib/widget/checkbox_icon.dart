import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

class CheckboxIcon extends StatelessWidget {
  const CheckboxIcon({super.key, required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: checked ? MyTheme.color.primary : null,
          border: Border.all(
            color: MyTheme.color.primary,
            width: 2,
          )),
      child: checked
          ? Icon(
              Icons.check,
              color: MyTheme.color.com1,
              size: 16,
            )
          : null,
    );
  }
}
