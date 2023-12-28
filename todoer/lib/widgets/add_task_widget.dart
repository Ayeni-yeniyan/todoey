import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });
  int get getID {
    return int.parse(formatDate(DateTime.now(), [
      yyyy,
      '',
      mm,
      '',
      dd,
      '',
      hh,
      '',
      nn,
      '',
      ss,
    ]));
  }

  @override
  Widget build(BuildContext context) {
    late String taskTitle;
    return Container(
      height: 800,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Add a Task',
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
            TextField(
              onChanged: (value) {
                taskTitle = value;
              },
              autofocus: true,
              decoration: const InputDecoration(focusColor: Colors.white),
            ),
            const SizedBox(height: 7),
            TextButton(
              style: TextButton.styleFrom(
                  minimumSize: const Size(350, 0),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(Task(
                  title: taskTitle,
                  id: getID,
                ));

                Navigator.pop(context);
              },
              child: const Text('Add task'),
            )
          ],
        ),
      ),
    );
  }
}
