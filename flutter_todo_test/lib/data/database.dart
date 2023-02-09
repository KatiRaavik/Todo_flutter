
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class tasksDatabase {

  // list of tasks
  List taskList = [];

  // box reference
  final _myDataBox = Hive.box('myDataBox');

  // first time opening app
  void openInitialData() {
    taskList = [
      ['Take a break', false,],
      ['Bake a cake', true,],
    ];
  }

  // load data from database
  void loadData() {
    taskList = _myDataBox.get('TASKLIST');
  }

  // update database
  void updateData() {
    _myDataBox.put('TASKLIST', taskList);
  }
}
