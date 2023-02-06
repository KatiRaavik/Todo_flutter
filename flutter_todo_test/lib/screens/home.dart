import 'package:flutter/material.dart';
import 'package:flutter_todo_test/materials/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> taskNames = [
    'Esimene',
    'Teine',
    'Kolmas',
  ];
  String taskName = 'Esimene';

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
              children: taskNames.map((taskName) {
                return Row(
                  children: [
                    Checkbox(value: false, onChanged: ((value) => {})),
                    SizedBox(width: 5.0),
                    Text(taskName),
                  ],
                );
              }).toList(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 70.0, 15.0),
              child: TextField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25.0,
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
            taskName = '';
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
