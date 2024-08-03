import 'package:flutter_application_1/Task.dart';

class TasksBuilder {
  static List<Task> tasks = [];

  int tasksNumber = 0;

  int getTasksNumber() {
    return tasks.length;
  }

  void addNewTask(String task) {
    tasks.add(Task(task, false));
  }
}
