import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/task_list.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddTaskWidget();
            },
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 45,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text.rich(
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      TextSpan(text: 'todoer\n', children: [
                        TextSpan(
                          text:
                              '${Provider.of<TaskData>(context).taskAmount} tasks',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TaskList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
