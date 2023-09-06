import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/addtask_page.dart';
import 'package:test/todo_tile.dart';
// import 'package:test/filter.dart'; --- Importera när filter är klart

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of todo task for UI
  List toDoList = [
    ['Plugga', false],
    ['Laga mat', false],
    ['Läs bok', false],
  ];

  // Navigate to next screen
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addTask()));
  }

  //Method for checking boxes
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background
      backgroundColor: Color.fromARGB(255, 171, 229, 240),

      // AppBAR
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 177, 182),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: const Text('TO DO LIST',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.white)),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                icon: Icon(Icons.more_vert, color: Colors.white))
          ]),

      // Floating action -- Navigate to add task screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToNextScreen(context);
        },
        backgroundColor: Colors.cyan,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      // List view -- Tasks
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}

// Pop up filter, dialouge box
Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Filter'),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("All"),
        Text("Done"),
        Text("Undone"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Apply'),
      ),
    ],
  );
}
