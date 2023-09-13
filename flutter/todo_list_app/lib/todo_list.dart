import 'package:flutter/material.dart';
import 'package:todo_list_app/data/database.dart';
import 'package:todo_list_app/util/dialogue_box.dart';
import 'package:todo_list_app/util/todo_tile.dart';
import 'package:hive/hive.dart';

class TodoLists extends StatefulWidget {
  const TodoLists({
    super.key,
  });
  @override
  State<TodoLists> createState() => _TodoListsState();
}

class _TodoListsState extends State<TodoLists> {
  TextEditingController controller = TextEditingController();

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (Hive.box('myBox').get('todolist') != null) {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxClicked(index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void addTask() {
    setState(() {
      db.todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: controller,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: addTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            isChecked: db.todoList[index][1],
            deleteFunction: (context) {
              deleteTask(index);
            },
            onChanged: (value) {
              checkBoxClicked(index);
            },
          );
        },
        itemCount: db.todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
