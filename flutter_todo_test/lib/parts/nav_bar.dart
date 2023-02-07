import 'package:flutter/material.dart';

import '../materials/colors.dart';

AppBar navBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: tdYellow,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'To do list:',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25.0,
            color: Colors.grey[800],
          ),
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
  );
}
