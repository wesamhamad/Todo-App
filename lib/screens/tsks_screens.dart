import 'package:flutter/material.dart';
import 'package:flutter_application_1/tasksBuilder.dart';
import 'package:flutter_application_1/widgets/tasks_list.dart';
import 'package:flutter_application_1/screens/add_task.dart';

class TasksScreen extends StatefulWidget {
  static int tasksNumber = TasksBuilder.tasks.length;

  const TasksScreen({super.key});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    TasksScreen.tasksNumber = TasksBuilder().getTasksNumber();
  }

  void handleTaskChanged(int index, bool? newValue) {
    setState(() {
      TasksBuilder.tasks[index].iscChecked = newValue!;
      if (TasksBuilder.tasks[index].iscChecked) {
        TasksScreen.tasksNumber--;
      } else {
        TasksScreen.tasksNumber++;
      }
    });
  }

  void addNewTask(String task) {
    setState(() {
      TasksBuilder().addNewTask(task);
      TasksScreen.tasksNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => AddTaskScreen(addTaskCallback: addNewTask),
            // SingleChildScrollView(
            //       child: Container(
            //         padding: EdgeInsets.only(
            //             bottom: MediaQuery.of(context).viewInsets.bottom),
            //         child: AddTaskScreen(addTaskCallback: addNewTask),
            //       ),
            //     )
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${TasksScreen.tasksNumber} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(onTaskChanged: handleTaskChanged),
            ),
          ),
        ],
      ),
    );
  }
}
