import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_todo/src/widgets/task_list_item.dart';
import 'package:flutter_todo/src/provider/task_list_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskListProvider = Provider.of<TaskListProvider>(context);

    return Expanded(
      child: ListView.separated(
        itemCount: taskListProvider.length(),
        separatorBuilder: (context, position) {
          return SizedBox(
            height: 15,
          );
        },
        itemBuilder: (context, position) {
          final task = taskListProvider.get(position);

          return Dismissible(
            key: Key(task.title),
            onDismissed: (DismissDirection dir) {
              taskListProvider.removeAt(position);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text(dir == DismissDirection.startToEnd ? "Task removed" : "Task Posponed"),
                  action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        taskListProvider.add(task, position: position);
                      }),
                ),
              );
            },
            background: _LeftToRight(),
            secondaryBackground: _RightToLeft(),
            child: TaskListItem(taskListProvider.get(position)),
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
