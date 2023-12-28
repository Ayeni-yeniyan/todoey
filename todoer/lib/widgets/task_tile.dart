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
    return InkWell(
      splashColor: Colors.blue,
      onLongPress: onLongPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          Checkbox(
            activeColor: Colors.blue,
            value: isDone,
            onChanged: checkBOxCallBack,
          )
        ],
      ),
    );
  }
}
