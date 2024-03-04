import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';
import 'package:go_router/go_router.dart';

class SubPageHeader extends StatelessWidget {
  const SubPageHeader({super.key, this.back = true, required this.title});

  final bool back;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.color.primary,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        children: [
          if (back)
            TouchableOpacity(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: MyTheme.color.com1,
                size: 18,
              ),
            ),
          Expanded(
            child: Center(
              child: Container(
                padding: back ? const EdgeInsets.only(right: 18) : null,
                child: Text(
                  title,
                  style: MyTheme.text.title.copyWith(
                    color: MyTheme.color.com1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
