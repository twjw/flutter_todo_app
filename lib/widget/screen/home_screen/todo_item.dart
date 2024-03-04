import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, this.border = true, this.completed = false});

  final bool border;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.color.primaryLight,
      child: Column(
        children: [
          if (border)
            Container(
              color: MyTheme.color.border,
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
                    color: MyTheme.color.primaryMedium,
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: MyTheme.color.com1,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do the dishes',
                        style: MyTheme.text.medium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '11:50 AM',
                        style: MyTheme.text.small,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: completed ? MyTheme.color.primary : null,
                      border: Border.all(
                        color: MyTheme.color.primary,
                        width: 2,
                      )),
                  child: completed
                      ? Icon(
                          Icons.check,
                          color: MyTheme.color.com1,
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
