import 'package:flutter/material.dart';
import 'package:flutter_todo/src/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 25, 15),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Due Fri Agu 8',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
