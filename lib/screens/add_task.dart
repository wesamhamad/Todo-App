import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String) addTaskCallback;

  AddTaskScreen({super.key, required this.addTaskCallback});

  final TextEditingController taskTexeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late String task;

    return Container(
      width: 450.0,
      color: const Color(0xf757575),
      child: Container(
        padding: const EdgeInsets.all(55.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            TextField(
              controller: taskTexeController,
              autocorrect: true,
              onChanged: (String value) {
                task = value;
              },
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              )),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  addTaskCallback(task);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: const BorderSide(color: Colors.lightBlueAccent),
                    ),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
