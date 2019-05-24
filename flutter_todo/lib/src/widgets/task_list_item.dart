import 'package:flutter/material.dart';
import 'package:flutter_todo/src/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Text(task.title),
    );
  }
}
