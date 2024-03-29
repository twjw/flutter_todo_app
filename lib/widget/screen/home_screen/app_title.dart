import 'package:flutter/material.dart';
import 'package:flutter_todo_app/helper/date_time_picker.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';
import 'package:go_router/go_router.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onChangeDate() async {
      final selectedDateTime = await showUnLimitDatePicker(context);
    }

    return Container(
      width: double.infinity,
      color: MyTheme.color.primary,
      child: Stack(
        children: [
          Positioned(
            right: 12,
            top: 12,
            child: TouchableOpacity(
              onTap: () {
                context.push('/setting');
              },
              child: Icon(
                Icons.settings,
                color: MyTheme.color.com1,
                size: 24,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TouchableOpacity(
                  onTap: onChangeDate,
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
          ),
        ],
      ),
    );
  }
}
