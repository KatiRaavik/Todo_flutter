class Task {
  String? id;
  String? taskName;
  bool completed;

  Task({
    required this.id,
    required this.taskName,
    this.completed = false,
  });

  static List<Task> taskList() {
    return [
      Task(
        id: '01',
        taskName: 'Esimene',
        completed: true,
      ),
      Task(
        id: '02',
        taskName: 'Teine',
      ),
      Task(
        id: '03',
        taskName: 'Kolmas',
      ),
    ];
  }
}
