import 'package:flutter/material.dart';
import 'state.dart';
import 'package:provider/provider.dart';
import 'todo_tile.dart';

class MyViewList extends StatelessWidget {
  const MyViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            toDoItem: value.toDoList[index],
          );
        },
      ),
    );
  }
}
