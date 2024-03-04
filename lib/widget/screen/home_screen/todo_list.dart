import 'dart:ffi';

import 'package:flutter/material.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.list, this.completed = false});

  final Array<dynamic> list;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth - 32,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              TodoItem(
                border: false,
                completed: completed,
              ),
              TodoItem(
                completed: completed,
              ),
              TodoItem(
                completed: completed,
              ),
            ],
          ),
        ),
      );
    });
  }
}
