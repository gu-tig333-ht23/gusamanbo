import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                side: BorderSide(color: Color.fromARGB(255, 33, 153, 168)),
                activeColor: Color.fromARGB(255, 33, 153, 168)),

            // Task name
            Expanded(
                child: Text(taskName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ))),

            // Delete task
            IconButton(onPressed: () {}, icon: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
