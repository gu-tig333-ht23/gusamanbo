import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'addtask_page.dart';
import 'filter.dart';
import 'viewlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        return MyFilter();
                      });
                },
                icon: Icon(Icons.more_vert, color: Colors.white))
          ]),

      // Floating action -- Navigate to add task screen
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return addTask();
        })),
        // Button design
        backgroundColor: Colors.cyan,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      // List view -- Tasks
      body: const MyViewList(),
    );
  }
}
