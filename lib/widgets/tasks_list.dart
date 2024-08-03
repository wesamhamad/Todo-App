import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/task_tile.dart';
import 'package:flutter_application_1/tasksBuilder.dart';

typedef TaskChangedCallback = void Function(int index, bool? newValue);

class TasksList extends StatelessWidget {
  final TaskChangedCallback onTaskChanged;

  const TasksList({
    super.key,
    required this.onTaskChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TasksBuilder().getTasksNumber(),
      itemBuilder: (context, index) {
        return TaskListTile(
          index: index,
          tasks: TasksBuilder.tasks,
          onTaskChanged: onTaskChanged,
        );
      },
    );
  }
}
