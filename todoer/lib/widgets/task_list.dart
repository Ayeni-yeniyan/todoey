import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        if (taskData.getTaskList.isEmpty) {
          return const Center(
              child: Text(
            'Add a Task...',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ));
        }
        return ListView.builder(
          itemCount: taskData.taskAmount,
          itemBuilder: (context, index) {
            final task = taskData.getTaskList[index];

            return TaskTile(
              title: task.title,
              isDone: task.isDone,
              checkBOxCallBack: (checkBoxState) {
                taskData.toggleTaskState(task);
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.spaceBetween,
                      title: const Text(
                        'Delete Task?',
                        style: TextStyle(fontSize: 30),
                      ),
                      content: const Text(
                        'Are you sure you want to delete this Task?',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            taskData.deleteTask(task.id);
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 30,
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
