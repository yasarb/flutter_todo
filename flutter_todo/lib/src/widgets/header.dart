import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:flutter_todo/src/provider/task_list_provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Title(),
                _Subtitle(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello Yasar',
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskListProvider = Provider.of<TaskListProvider>(context);
    return Text(
      taskCount(taskListProvider.length()),
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  String taskCount(int howMany) => Intl.plural(
        howMany,
        zero: 'You have no task',
        one: 'You have $howMany task',
        other: 'You have $howMany tasks',
        args: [howMany],
        name: 'taskCount',
        desc: 'Task counter',
      );
}
