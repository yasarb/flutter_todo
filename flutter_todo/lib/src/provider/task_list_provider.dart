import 'package:flutter/foundation.dart';

import 'package:flutter_todo/src/models/task.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> taskList;

  TaskListProvider() {
    taskList = [
      Task('Complete 10 push ups', TaskStatus.postponed, 1),
      Task('Interview schedule for Mike', TaskStatus.postponed, 2),
      Task('Meeting', TaskStatus.postponed, 3),
      Task('Complete 10 push ups', TaskStatus.postponed, 1),
      Task('Interview schedule for Mike', TaskStatus.postponed, 2),
      Task('Meeting', TaskStatus.postponed, 3),
      Task('Complete 10 push ups', TaskStatus.postponed, 1),
      Task('Interview schedule for Mike', TaskStatus.postponed, 2),
      Task('Meeting', TaskStatus.postponed, 3),
    ];
  }

  Task get(int position) {
    return taskList[position] ?? null;
  }

  int length() {
    return taskList.length;
  }

  void add(Task task, {int position = -1}) {
    if (position == -1) {
      taskList.add(task);
    } else {
      taskList.insert(position, task);
    }

    notifyListeners();
  }

  void removeAt(int position) {
    taskList.removeAt(position);
    notifyListeners();
  }

  void postpone(DateTime newDate, int position) {
    Task task = taskList[position];
  }
}
