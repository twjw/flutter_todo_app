import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_todo_app/type_converter/date_time_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:flutter_todo_app/dao/task_dao.dart';
import 'package:flutter_todo_app/entity/task.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
