import 'package:floor/floor.dart';

@Entity(tableName: 'task')
class Task {
  @primaryKey
  final int? id;
  final String title;
  @ColumnInfo(name: 'create_time')
  final DateTime createTime;
  @ColumnInfo(name: 'category_id')
  final int categoryId;
  final String? notes;

  Task({
    required this.id,
    required this.title,
    required this.createTime,
    required this.categoryId,
    this.notes,
  });
}
