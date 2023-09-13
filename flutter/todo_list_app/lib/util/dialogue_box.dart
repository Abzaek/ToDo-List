import 'package:flutter/material.dart';
import 'package:todo_list_app/util/my_buttons.dart';

class DialogueBox extends StatelessWidget {
  final TextEditingController controller;
  final Function onSave;
  final Function onCancel;
  const DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 150,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add new task',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Save button
                  MyButton(onPressed: onSave, text: 'save'),

                  const SizedBox(
                    width: 8,
                  ),
                  //cancel button
                  MyButton(onPressed: onCancel, text: 'cancel'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
