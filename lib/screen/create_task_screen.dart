import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/button.dart';
import 'package:flutter_todo_app/widget/screen/create_task_screen/form_label.dart';
import 'package:flutter_todo_app/widget/sub_page_wrap.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class CreateTaskScreen extends ConsumerWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubPageWrap(
      title: '新增事項',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const FormLabel(label: '名稱'),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '名稱不得為空';
                }
                return null;
              },
            ),
            Button(
              text: '儲存',
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Processing Data'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
