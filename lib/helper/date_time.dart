import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay toTimeOfDay(String timeStr) {
  final dt = timeStr.contains('PM')
      ? DateFormat.jm().parse(timeStr)
      : DateFormat('HH:mm').parse(timeStr);
  return TimeOfDay.fromDateTime(dt);
}
