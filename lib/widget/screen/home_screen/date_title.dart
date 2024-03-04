import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/color_theme.dart';
import 'package:flutter_todo_app/theme/text_theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';

class DateTitle extends StatelessWidget {
  const DateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppThemeColor.primary,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TouchableOpacity(
            onTap: () {
              var now = DateTime.now();

              showDatePicker(
                context: context,
                initialDate: now,
                firstDate: now,
                lastDate: DateTime(now.year, now.month + 3, now.day),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                          primary: AppThemeColor.primary),
                    ),
                    child: child!,
                  );
                },
              ).then((value) {
                if (value == null) return;
              });
            },
            child: Text(
              'Aug 4, 2023',
              style: AppThemeText.medium.copyWith(
                color: AppThemeColor.com1,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'My Todo List',
            style: AppThemeText.medium.copyWith(
              color: AppThemeColor.com1,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
