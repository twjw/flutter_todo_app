import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/constants.dart';
import 'package:flutter_todo_app/helper/date_time.dart';
import 'package:flutter_todo_app/helper/date_time_picker.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:flutter_todo_app/widget/button.dart';
import 'package:flutter_todo_app/widget/category_icon.dart';
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
    final categoryId = useState<int?>(null);

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
            CategoryListFormField(),
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

// 自定義表單標籤，通常這會有預設值啦，但為了練習尻一個沒預設值的
class CategoryListFormField extends FormField<int> {
  CategoryListFormField({
    FormFieldSetter<int?>? onSaved,
    int? initialValue,
    bool autovalidate = false,
  }) : super(
          onSaved: onSaved,
          validator: (int? value) {
            if (value == null) return '請選擇標籤';
            return null;
          },
          initialValue: initialValue,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          builder: (FormFieldState<int?> state) {
            return Column(
              children: [
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
                                    onTap: () {
                                      state.didChange(e.id);
                                      state.validate();
                                    },
                                    child: CategoryIcon(
                                        key: ValueKey(e),
                                        icon: e.icon,
                                        color: e.color,
                                        active: state.value == e.id),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                state.hasError
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            state.errorText ?? '',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            );
          },
        );
}

/*
// 範例就留著看，不調用
class CustomFormField extends FormField<String> {
  CustomFormField({
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? initialValue,
    bool autovalidate = false,
  }) : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue ?? '',
    autovalidateMode: autovalidate
        ? AutovalidateMode.always
        : AutovalidateMode.disabled,
    builder: (FormFieldState<String> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('请输入文本内容:'),
          TextField(
            onChanged: (String value) {
              state.didChange(value);
            },
          ),
          state.hasError
              ? Text(
            state.errorText ?? '',
            style: TextStyle(
              color: Colors.red,
            ),
          )
              : Container(),
        ],
      );
    },
  );
}

Form(
  child: Column(
    children: <Widget>[
      MyCustomFormField(
        validator: (String? value) {
          if(value == null || value.isEmpty) {
            return '请输入内容';
          }
          return null;
        },
        onSaved: (String? value) {
          // Handle the value.
        },
      ),
      ElevatedButton(
        onPressed: () {
          // Validate and save.
        },
        child: Text('Submit'),
      ),
    ],
  ),
);
*/
