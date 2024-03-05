import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/helper/date_time.dart';
import 'package:flutter_todo_app/helper/date_time_picker.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/button.dart';
import 'package:flutter_todo_app/widget/category.dart';
import 'package:flutter_todo_app/widget/screen/create_task_screen/form_label.dart';
import 'package:flutter_todo_app/widget/sub_page_wrap.dart';
import 'package:flutter_todo_app/widget/touchable_opacity.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final _formKey = GlobalKey<FormState>();

class CreateTaskScreen extends HookConsumerWidget {
  static CreateTaskScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final dateTextController =
        useTextEditingController(text: DateFormat.yMMMMd().format(now));
    final timeTextController =
        useTextEditingController(text: DateFormat.jm().format(now));

    Future<void> onChangeDate() async {
      print(dateTextController.text);
      final selectedDateTime = await showFormDatePicker(
          context, DateFormat('MMMM d, y').parse(dateTextController.text));
      dateTextController.text = DateFormat.yMMMMd().format(selectedDateTime);
    }

    Future<void> onChangeTime() async {
      final selectedTime = await showFormTimePicker(
          context, toTimeOfDay(timeTextController.text));
      timeTextController.text = DateFormat.jm().format(selectedTime);
    }

    return SubPageWrap(
      title: '新增事項',
      bottomChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Button(
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
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const FormLabel(label: '名稱'),
            const SizedBox(height: 4),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '事項名稱',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '名稱不得為空';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '標籤',
                  style: MyTheme.text.medium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TouchableOpacity(
                                onTap: () {},
                                child: Category(
                                  key: ValueKey(e),
                                  icon: e.icon,
                                  color: e.color,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const FormLabel(label: '日期'),
                      TextField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        controller: dateTextController,
                        onTap: onChangeDate,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const FormLabel(label: '時間'),
                      TextField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.access_time_sharp),
                        ),
                        readOnly: true,
                        controller: timeTextController,
                        onTap: onChangeTime,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const FormLabel(label: '備註'),
            TextField(
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: '事項備註',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isCheckboxChecked = false;

  bool _validateCheckbox(bool value) {
    if (_isCheckboxChecked) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          FormField<bool>(
            initialValue: _isCheckboxChecked,
            validator: (value) {
              return _validateCheckbox(value!) ? null : 'Checkbox must be checked';
            },
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                value: _isCheckboxChecked,
                onChanged: (bool? value) {
                  // 保存 Checkbox 状态并触发表单验证
                  setState(() {
                    _isCheckboxChecked = value!;
                    state.didChange(value);
                  });
                },
                title: new Text('Check me'),
              );
            }
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // 当所有验证都通过后
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
 */
