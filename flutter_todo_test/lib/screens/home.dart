import 'package:flutter/material.dart';
import 'package:flutter_todo_test/data/database.dart';
import 'package:flutter_todo_test/materials/colors.dart';
import 'package:hive/hive.dart';

import '../parts/nav_bar.dart';
import '../widgets/task_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // reference box
  final _myDataBox = Hive.box('myDataBox');
  // access database
  tasksDatabase db = tasksDatabase();

  @override
  void initState() {
    // first time running app, create dummy data
    if (_myDataBox.get('TASKLIST') == null) {
      db.openInitialData();
    } else {
      // if there is already data
      db.loadData();
    }
    super.initState();
  }

  // new item textfield controller
  final _taskNameController = TextEditingController();
  // new item adding function
  void _addTasks(String task) {
    setState(() {
      if (_taskNameController.text != '') {
        db.taskList.add([_taskNameController.text, false]);
        // clears the field
        _taskNameController.clear();
      }
    });
    db.updateData();
  }

  // checks task to be completed
  void checkboxAction(bool? value, int index) {
    setState(() {
      db.taskList[index][1] = !db.taskList[index][1];
    });
    db.updateData();
  }

  // deletes task
  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
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
          children: [
            Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: db.taskList.length,
                    itemBuilder: (context, index) {
                      return taskView(
                        task: db.taskList[index][0],
                        deletesTask: () => deleteTask(index),
                        onChanged: (value) => checkboxAction(value, index),
                        completed: db.taskList[index][1],
                      );
                    },
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 70.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              // type new task
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
                // max letters
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
        enableFeedback: true,
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
