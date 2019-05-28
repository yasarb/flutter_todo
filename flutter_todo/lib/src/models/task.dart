enum TaskStatus { postponed, done }

class Task implements Comparable<Task> {
  final String title;
  final TaskStatus status;
  final DateTime dueDate;

  Task(this.title, this.status, this.dueDate);

  Task copyWith({String title, TaskStatus status, DateTime dueDate}) {
    return new Task(
      title ?? this.title,
      status ?? this.status,
      dueDate ?? this.dueDate,
    );
  }

  @override
  int compareTo(Task otherTask) {
    return this.dueDate.compareTo(otherTask.dueDate);
  }
}
