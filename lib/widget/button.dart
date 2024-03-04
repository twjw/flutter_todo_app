import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPress,
    required this.text,
  });

  final Function? onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
          color: MyTheme.color.primary,
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              text,
              style: MyTheme.text.medium.copyWith(
                color: MyTheme.color.com1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
