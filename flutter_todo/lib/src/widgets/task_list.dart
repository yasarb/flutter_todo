import 'package:flutter/material.dart';

import 'package:flutter_todo/src/models/task.dart';
import 'package:flutter_todo/src/widgets/task_list_item.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> _taskList;

  @override
  void initState() {
    List<Task> myList = [
      Task('task 1', TaskStatus.postponed, 1),
      Task('task 2', TaskStatus.postponed, 2),
      Task('task 3', TaskStatus.postponed, 3),
    ];

    setState(() {
      _taskList = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: ListView.builder(
            itemCount: _taskList.length,
            itemBuilder: (context, position) {
              return TaskListItem(_taskList[position]);
            },
          ),
        ),
      ),
    );
  }
}
