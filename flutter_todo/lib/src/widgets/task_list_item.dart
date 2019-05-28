import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_todo/src/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    var dateFormat;

    if (task.dueDate.year == DateTime.now().year) {
      // don't show if it is in current year
      dateFormat = 'EEE, MMM d, h:mm a';
    } else {
      dateFormat = 'EEE, MMM d, y, h:mm a';
    }

    var formattedDate = new DateFormat(dateFormat).format(task.dueDate);

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
                  'Due ' + formattedDate,
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
