import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addtask_page.dart';
import 'filter.dart';
import 'todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TaskFilter currentFilter =
      TaskFilter.All; // Initialize with 'All' tasks shown

  List<ToDoItem> toDoList = [];

// Filter tasks
  List<ToDoItem> filterTasks() {
    switch (currentFilter) {
      case TaskFilter.All:
        return toDoList;
      case TaskFilter.Done:
        return toDoList.where((task) => task.taskCompleted).toList();
      case TaskFilter.Undone:
        return toDoList.where((task) => !task.taskCompleted).toList();
    }
  }

  // Navigate to next screen and receive new tasks
  void _navigateToAddTask(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addTask()))
        .then((value) {
      if (value != null && value.isNotEmpty) {
        toDoList.add(ToDoItem(taskName: value, taskCompleted: false));
        setState(() {}); //Update homepage
      }
    });
  }

  // Method for checking boxes, marking tasks complete
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index].taskCompleted = value ?? false;
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

            // Filter button
            actions: [
              IconButton(
                  onPressed: () {
                    // Open dialogbox
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MyFilter(onFilterSelected: (filter) {
                            setState(() {
                              currentFilter = filter;
                            });
                            Navigator.of(context).pop();
                          });
                        });
                  },
                  icon: Icon(Icons.more_vert, color: Colors.white))
            ]),

        // Floating action -- Navigate to add task screen
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToAddTask(context);
          },
          // Button design
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),

        // List view -- Tasks
        body: ListView.builder(
          itemCount: filterTasks().length,
          itemBuilder: (BuildContext context, int index) {
            final filteredTasks = filterTasks();
            return ToDoTile(
              toDoItem: filteredTasks[index],
              onChanged: (bool? newValue) {
                checkBoxChanged(newValue, index);
              },
              // Delete task function
              onDelete: () {
                if (index >= 0 && index < toDoList.length) {
                  setState(() {
                    toDoList.removeAt(index);
                  });
                }
              },
            );
          },
        ));
  }
}
