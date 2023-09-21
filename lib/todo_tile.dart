import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class ToDoTile extends StatelessWidget {
  final ToDoItem toDoItem;

  ToDoTile({
    super.key,
    required this.toDoItem,
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
            GestureDetector(
              onTap: () {
                context.read<MyState>().checkBoxChanged(toDoItem);
              },
              child: !toDoItem.taskCompleted // if statement för checkbox
                  ? const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.cyan,
                    )
                  : const Icon(
                      Icons.check_box,
                      color: Colors.cyan,
                    ),
            ),

            // Create some space between checkbox and taskname
            const SizedBox(width: 15),

            // Task name
            Expanded(
                child: Text(toDoItem.taskName,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: toDoItem.taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ))),

            // Delete task (Function in home page)
            IconButton(
                onPressed: () {
                  context.read<MyState>().deleteTask(toDoItem);
                },
                icon: const Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
