import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_test/materials/colors.dart';
import 'package:flutter_todo_test/models/task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final taskList = Task.taskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdYellow,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdGrey,
              size: 30,
            ),
            Container(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('./assets/images/Todo.jpeg'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topLeft,
        color: Colors.greenAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: taskList.map((task) {
                return Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child:
                            Checkbox(value: false, onChanged: ((value) => {}))),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '${task.taskName}',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: tdGrey,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 70.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  counterText: '',
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
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            '';
          });
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
