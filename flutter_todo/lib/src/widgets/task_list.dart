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
      Task('Complete 10 push ups', TaskStatus.postponed, 1),
      Task('Interview schedule for Mike', TaskStatus.postponed, 2),
      Task('Meeting', TaskStatus.postponed, 3),
    ];

    setState(() {
      _taskList = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: _taskList.length,
        separatorBuilder: (context, position) {
          return SizedBox(
            height: 15,
          );
        },
        itemBuilder: (context, position) {
          final task = _taskList[position];
          return Dismissible(
            key: Key(task.title),
            onDismissed: (DismissDirection dir) {
              setState(() => _taskList.removeAt(position));
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(dir == DismissDirection.startToEnd ? "Item removed" : "Item Liked"),
                  action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        setState(() => _taskList.insert(position, task));
                      }),
                ),
              );
            },
            background: _LeftToRight(),
            secondaryBackground: _RightToLeft(),
            child: TaskListItem(_taskList[position]),
          );
        },
      ),
    );
  }
}

class _LeftToRight extends StatelessWidget {
  const _LeftToRight({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 32,
      ),
      color: Colors.green,
      alignment: Alignment.centerLeft,
    );
  }
}

class _RightToLeft extends StatelessWidget {
  const _RightToLeft({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Icon(
        Icons.alarm,
        color: Colors.white,
        size: 32,
      ),
      color: Colors.amber.shade700,
      alignment: Alignment.centerRight,
    );
  }
}
