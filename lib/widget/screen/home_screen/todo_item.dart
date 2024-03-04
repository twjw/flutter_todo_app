import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/color_theme.dart';
import 'package:flutter_todo_app/theme/text_theme.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, this.border = true, this.completed = false});

  final bool border;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeColor.primaryLight,
      child: Column(
        children: [
          if (border)
            Container(
              color: AppThemeColor.border,
              height: 2,
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: AppThemeColor.primaryMedium,
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: AppThemeColor.com1,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do the dishes',
                        style: AppThemeText.medium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '11:50 AM',
                        style: AppThemeText.small,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: completed ? AppThemeColor.primary : null,
                      border: Border.all(
                        color: AppThemeColor.primary,
                        width: 2,
                      )),
                  child: completed
                      ? Icon(
                          Icons.check,
                          color: AppThemeColor.com1,
                          size: 16,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
