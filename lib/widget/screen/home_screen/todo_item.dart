import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';
import 'package:flutter_todo_app/widget/category_icon.dart';
import 'package:flutter_todo_app/widget/checkbox_icon.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, this.border = true, this.completed = false});

  final bool border;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext bc) {
              return FractionallySizedBox(
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyTheme.color.com1,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          CategoryIcon(
                            icon: Icons.access_time_sharp,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '事項名稱',
                            style: MyTheme.text.title
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '日期',
                            style: MyTheme.text.medium
                                .copyWith(color: MyTheme.color.secondary),
                          ),
                          if ('completed' != null) const SizedBox(height: 18),
                          if ('completed' != null)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '已完成於{日期}',
                                  style: MyTheme.text.medium
                                      .copyWith(color: MyTheme.color.secondary),
                                ),
                                SizedBox(width: 8),
                                CheckboxIcon(checked: true),
                              ],
                            ),
                          if ('description' != null) const SizedBox(height: 40),
                          if ('description' != null)
                            Text(
                              '簡述',
                              style: MyTheme.text.medium
                                  .copyWith(color: MyTheme.color.secondary),
                            ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ));
            });
      },
      child: Container(
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
                  CheckboxIcon(checked: completed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
