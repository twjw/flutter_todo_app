import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';

class DateTitle extends StatelessWidget {
  const DateTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyTheme.color.primary,
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
                      colorScheme: ColorScheme.light(
                        primary: MyTheme.color.primary,
                      ),
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
              style: MyTheme.text.medium.copyWith(
                color: MyTheme.color.com1,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '你的事項',
            style: MyTheme.text.medium.copyWith(
              color: MyTheme.color.com1,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
