import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  final Function(BuildContext)? deleteFunction;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isChecked,
    required this.onChanged,
    required this.deleteFunction,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 17),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow,
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: isChecked, onChanged: onChanged),
              Text(
                taskName,
                style: TextStyle(
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
