import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        label,
        style: MyTheme.text.medium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
