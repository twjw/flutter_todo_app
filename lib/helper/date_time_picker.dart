import 'package:flutter/material.dart';
import 'package:flutter_todo_app/theme/theme.dart';

Theme _datePickerBuilder(BuildContext context, Widget? child) {
  return Theme(
    data: ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(
        primary: MyTheme.color.primary,
      ),
    ),
    child: child!,
  );
}

Future<DateTime> showFormDatePicker(BuildContext context,
    [DateTime? initialDate]) async {
  final now = DateTime.now();
  final _initialDate = initialDate ?? now;
  final selectedDateTime = await showDatePicker(
    context: context,
    initialDate: _initialDate,
    firstDate: now,
    lastDate: DateTime(now.year, now.month + 3, now.day),
    builder: _datePickerBuilder,
  );

  return selectedDateTime ?? _initialDate;
}

Future<DateTime?> showUnLimitDatePicker(BuildContext context,
    [DateTime? initialDate]) async {
  final now = DateTime.now();
  final _initialDate = initialDate ?? now;
  final selectedDateTime = await showDatePicker(
    context: context,
    initialDate: _initialDate,
    firstDate: DateTime(now.year - 120),
    lastDate: DateTime(now.year + 120),
    builder: _datePickerBuilder,
  );

  return selectedDateTime ?? _initialDate;
}

Future<DateTime> showFormTimePicker(BuildContext context,
    [TimeOfDay? initialTime]) async {
  var _initialTime = initialTime ?? TimeOfDay.now();
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: _initialTime,
    builder: _datePickerBuilder,
  );

  var now = DateTime.now();
  var selectedDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    selectedTime?.hour ?? _initialTime.hour,
    selectedTime?.minute ?? _initialTime.minute,
  );

  return selectedDateTime;
}
