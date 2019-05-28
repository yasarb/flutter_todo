import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:flutter_todo/src/models/task.dart';

class TaskListProvider extends ChangeNotifier {
  static final int MIN_TIMESTAMP = 1564691473;
  static final int MAX_TIMESTAMP = 1627824673;
  static final int DIFF = MAX_TIMESTAMP - MIN_TIMESTAMP;

  List<Task> taskList;

  TaskListProvider() {
    var rng = new Random(new DateTime.now().millisecondsSinceEpoch);

    List<DateTime> randomDates = new List.generate(
      9,
      (_) => new DateTime.fromMillisecondsSinceEpoch((rng.nextInt(DIFF) + MIN_TIMESTAMP) * 1000),
    );

    randomDates.shuffle();

    taskList = [
      Task('Complete 10 push ups', TaskStatus.postponed, randomDates[0]),
      Task('Interview schedule for Mike', TaskStatus.postponed, randomDates[1]),
      Task('Meeting', TaskStatus.postponed, randomDates[2]),
      Task('Complete 10 push ups', TaskStatus.postponed, randomDates[3]),
      Task('Interview schedule for Mike', TaskStatus.postponed, randomDates[4]),
      Task('Meeting', TaskStatus.postponed, randomDates[5]),
      Task('Complete 10 push ups', TaskStatus.postponed, randomDates[6]),
      Task('Interview schedule for Mike', TaskStatus.postponed, randomDates[7]),
      Task('Meeting', TaskStatus.postponed, randomDates[8]),
    ];

    taskList.sort();
  }

  Task get(int position) {
    return taskList[position] ?? null;
  }

  int length() {
    return taskList.length;
  }

  void add(Task task, {int position = -1}) {
    taskList.add(task);
    taskList.sort();

    notifyListeners();
  }

  void removeAt(int position) {
    taskList.removeAt(position);
    notifyListeners();
  }

  void postpone(DateTime newDate, int position) {
    Task newTask = taskList[position];

    removeAt(position);
    add(newTask, position: position);
  }
}
