import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'my_button.dart';
import 'state.dart';

class addTask extends StatelessWidget {
  addTask({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void message(String text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.cyan,
        duration: const Duration(seconds: 2),
      ));
    }

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
      body: Padding(
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
              Consumer(
                builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: MyButton(
                        text: 'ADD TASK',
                        onPressed: () {
                          String enteredText = _controller.text;
                          if (enteredText == '') {
                            message(
                                'The text field is empty, please enter a name for your task!');
                          } else {
                            Provider.of<MyState>(context, listen: false)
                                .saveNewTask(enteredText);
                            _controller.clear();
                            message('Task entered!');
                            Navigator.of(context).pop();
                          }
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
