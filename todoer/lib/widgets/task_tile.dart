import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.title,
      required this.isDone,
      required this.checkBOxCallBack,
      required this.onLongPress});
  final String title;
  final bool isDone;
  final Function(bool?) checkBOxCallBack;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.blue,
      onLongPress: onLongPress,
      horizontalTitleGap: 5,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.blue,
        value: isDone,
        onChanged: checkBOxCallBack,
      ),
    );
  }
}
