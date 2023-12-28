import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'task.dart';

class DatabaseHelper {
  final String tableName = 'taskList';
  static const String id = 'id';
  static const String name = 'name';
  static const String isDone = 'isDone';

  Future<Database> openTaskDataBase() async {
    final database = openDatabase(
      p.join(await getDatabasesPath(), 'tasklist_db.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $tableName($id INTEGER PRIMARY KEY, $name TEXT, $isDone INTEGER)');
      },
      version: 1,
    );
    return database;
  }

  Future<List<Task>> getDataBaseTaskList() async {
    final db = await openTaskDataBase();
    final List<Map<String, dynamic>> taskMaps = await db.query(tableName);
    db.close();

    return List.generate(taskMaps.length, (index) {
      bool intDone = false;
      if (taskMaps[index][isDone] == 1) {
        intDone = true;
      }
      return Task(
        id: taskMaps[index][id],
        title: taskMaps[index][name],
        isDone: intDone,
      );
    });
  }

  Future<void> insertTaskToDataBase(Task task) async {
    final db = await openTaskDataBase();
    await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> toggleTaskState(Task task) async {
    final db = await openTaskDataBase();
    task.toggleIsDone();

    await db.update(
      tableName,
      task.toMap(),
      where: '$id=?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await openTaskDataBase();
    await db.delete(tableName, where: '$id=?', whereArgs: [id]);
  }
}
