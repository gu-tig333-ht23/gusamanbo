import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class addTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 229, 240),

      // AppBar
      appBar: AppBar(
          // Return button white
          iconTheme: IconThemeData(color: Colors.white),
          // Design of AppBar
          backgroundColor: Color.fromARGB(255, 45, 177, 182),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: const Text('ADD NEW TASK:',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.white))),
      body: const NewTask(),
    );
  }
}

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _controller = TextEditingController();

  // Method for saving new task
  void saveNewTask(val) {
    setState(() {
      // Send back taskname to homepage
      Navigator.of(context).pop(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 25.0, bottom: 500),

        // White box
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          // Input
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'What are you going to do?',
                  icon: Icon(Icons.check),
                ),
              ),

              // Add button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String enteredText = _controller.text;
                    saveNewTask(enteredText);
                  },
                  child: const Text(
                    '+ Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
