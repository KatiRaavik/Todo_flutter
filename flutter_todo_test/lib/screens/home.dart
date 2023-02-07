import 'package:flutter/material.dart';
import 'package:flutter_todo_test/materials/colors.dart';
import 'package:flutter_todo_test/models/task.dart';

import '../parts/nav_bar.dart';
import '../widgets/task_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // tasks
  final taskList = Task.taskList();
  // new item textfield controller
  final _taskNameController = TextEditingController();
  // new item adding function
  void _addTasks(String task) {
    setState(() {
      taskList.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        taskName: task,
      ));
    });
    // clears the field
    _taskNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topLeft,
        color: Colors.greenAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // to do list in lastly added order
              children: taskList.reversed
                  .map((task) => taskView(
                        task: task,
                        delete: () {
                          setState(() {
                            taskList.remove(task);
                          });
                        },
                      ))
                  .toList(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 70.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              // new item field
              child: TextField(
                controller: _taskNameController,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Add new item...',
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
                  border: InputBorder.none,
                ),
                maxLength: 30,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
      // new item button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTasks(_taskNameController.text);
        },
        backgroundColor: tdGreen,
        child: Text(
          '+',
          style: TextStyle(
            fontSize: 40.0,
            fontFamily: 'Poppins',
            color: Colors.greenAccent[100],
          ),
        ),
      ),
    );
  }
}
