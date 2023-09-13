import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  final _myBox = Hive.box('myBox');

  // load data

  void loadData() {
    todoList = _myBox.get('todolist');
  }

  //update data

  void updateData() {
    _myBox.put('todolist', todoList);
  }
}
