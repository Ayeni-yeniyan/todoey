import 'database_helper.dart';

class Task {
  final String title;
  bool isDone;
  final int id;

  Task({required this.title, this.isDone = false, required this.id});

  void toggleIsDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    int intDone = 0;
    if (isDone == true) {
      intDone = 1;
    }
    return {
      DatabaseHelper.id: id,
      DatabaseHelper.name: title,
      DatabaseHelper.isDone: intDone,
    };
  }
}
