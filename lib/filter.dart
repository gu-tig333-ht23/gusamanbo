import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';
import 'my_button.dart';

class MyFilter extends StatelessWidget {
  MyFilter({
    super.key,
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
                context.read<MyState>().setFilter('all');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 8, width: 150),
          MyButton(
              // Select DONE -- return done items
              text: "Done",
              onPressed: () {
                context.read<MyState>().setFilter('done');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 8, width: 150),
          MyButton(
              // Select UNDONE -- return undone items
              text: "Undone",
              onPressed: () {
                context.read<MyState>().setFilter('undone');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 8, width: 150),
        ],
      ),
      // Cancel button
      actions: <Widget>[
        const SizedBox(height: 12),
        MyButton(
            text: 'Cancel',
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
