import 'package:floor/floor.dart';
import 'package:flutter_todo_app/entity/task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Person WHERE create_time = :createTime')
  Future<List<Task>> findTaskListByCreateTime(DateTime createTime);

  @insert
  Future<void> insertTask(Task task);

  @update
  Future<int> updateTask(Task task);

  @delete
  Future<int> deleteTask(Task task);
}
