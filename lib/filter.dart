import 'package:flutter/material.dart';
import 'my_button.dart';

enum TaskFilter {
  All,
  Done,
  Undone,
}

// ignore: must_be_immutable
class MyFilter extends StatelessWidget {
  final Function(TaskFilter) onFilterSelected;

  MyFilter({
    super.key,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter your tasks',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
              // Select ALL -- return all
              text: "All",
              onPressed: () {
                onFilterSelected(TaskFilter.All);
              }),
          const SizedBox(height: 8, width: 150),
          MyButton(
              // Select DONE -- return done items
              text: "Done",
              onPressed: () {
                onFilterSelected(TaskFilter.Done);
              }),
          const SizedBox(height: 8, width: 150),
          MyButton(
              // Select UNDONE -- return undone items
              text: "Undone",
              onPressed: () {
                onFilterSelected(TaskFilter.Undone);
              }),
          const SizedBox(height: 8, width: 150),
        ],
      ),
      // Cancel button
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
