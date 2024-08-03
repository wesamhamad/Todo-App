import 'package:flutter/material.dart';
import 'package:flutter_application_1/Task.dart';

typedef TaskChangedCallback = void Function(int index, bool? newValue);

class TaskListTile extends StatelessWidget {
  final int index;
  final List<Task> tasks;
  final TaskChangedCallback onTaskChanged;

  TaskListTile({
    super.key,
    required this.index,
    required this.tasks,
    required this.onTaskChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: tasks[index].iscChecked,
      onChanged: (value) {
        onTaskChanged(index, value);
      },
      activeColor: Colors.lightBlueAccent,
      checkColor: Colors.white,
      title: Text(
        tasks[index].task,
        style: TextStyle(
          decoration: tasks[index].iscChecked
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    );
  }
}
