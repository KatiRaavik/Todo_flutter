import 'package:flutter/material.dart';
import 'dart:core';

import '../materials/colors.dart';
import '../models/task.dart';

class taskView extends StatefulWidget {
  final Task task;
  final VoidCallback delete;
  taskView({
    super.key,
    required this.task,
    required this.delete,
  });

  @override
  State<taskView> createState() => _taskViewState();
}

class _taskViewState extends State<taskView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Checkbox(
            value: widget.task.completed,
            onChanged: (newValue) => {
              setState(() {
                // set the value of checkbox
                widget.task.completed = newValue!;
                // set value of tasks list on completion
                if (newValue == false) {
                  setState(() {
                    widget.task.completed = false;
                  });
                } else {
                  setState(() {
                    widget.task.completed = true;
                  });
                }
              })
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            // assign task name
            widget.task.taskName,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20.0,
              color: Colors.grey[800],
              // cross out when completed
              decoration:
                  widget.task.completed ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            // call delete functiion
            onPressed: widget.delete,
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
