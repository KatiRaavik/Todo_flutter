import 'package:flutter/material.dart';
import 'package:flutter_todo_test/data/database.dart';
import 'dart:core';

import '../materials/colors.dart';

class taskView extends StatelessWidget {
  final String task;
  void Function()? deletesTask;
  Function(bool?)? onChanged;
  final bool completed;

  taskView({
    super.key,
    required this.task,
    required this.deletesTask,
    required this.onChanged,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            value: completed,
            // set the value of checkbox
            onChanged: onChanged,
            activeColor: Colors.green[600],
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            // task name
            task,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20.0,
              color: Colors.grey[800],
              // cross out when completed
              decoration: completed ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            // call delete function
            onPressed: deletesTask,
            icon: Icon(
              Icons.delete,
              color: tdGrey,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
