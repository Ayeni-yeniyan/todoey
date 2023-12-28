import 'dart:collection';

import 'package:flutter/material.dart';

import 'task.dart';
import 'database_helper.dart';

class TaskData extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Task> _task = [];

  int get taskAmount {
    return _task.length;
  }

  UnmodifiableListView<Task> get getTaskList {
    return UnmodifiableListView(_task);
  }

  void writeTaskToDatabase(Task task) async {
    await _databaseHelper.insertTaskToDataBase(task);
  }

  Future<void> getTaskListFromDatabase() async {
    final List<Task> newTaskList = await _databaseHelper.getDataBaseTaskList();
    _task = newTaskList;
    notifyListeners();
  }

  void addTask(Task newTask) async {
    await _databaseHelper.insertTaskToDataBase(newTask);
    getTaskListFromDatabase();
  }

  void toggleTaskState(Task task) async {
    await _databaseHelper.toggleTaskState(task);
    getTaskListFromDatabase();
  }

  void deleteTask(Task task) {
    _databaseHelper.deleteTask(task.id);
    getTaskListFromDatabase();
  }
}
