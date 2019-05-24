enum TaskStatus { postponed, done }

class Task {
  final String title;
  final TaskStatus status;
  final int dueDateTimestamp;

  Task(this.title, this.status, this.dueDateTimestamp);
}
