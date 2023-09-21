import 'package:flutter/material.dart';
import 'fetch_internet.dart';

class ToDoItem {
  final String taskName;
  bool taskCompleted;
  final String? id;

  ToDoItem(
    this.taskName, {
    this.taskCompleted = false,
    this.id,
  });

  factory ToDoItem.fromJson(Map<String, dynamic> json) {
    return ToDoItem(json['title'], taskCompleted: json['done'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {'title': taskName, 'done': taskCompleted};
  }
}

class MyState extends ChangeNotifier {
  List<ToDoItem> _toDoList = [];

  // Fetch list from API
  void fetchList() async {
    var toDoList = await InternetFetcher.fetchData();
    _toDoList = toDoList;
    notifyListeners();
  }

  InternetFetcher internetFetcher = InternetFetcher();

  // Check off tasks
  void checkBoxChanged(toDoItem) async {
    toDoItem.taskCompleted = !toDoItem.taskCompleted;
    await internetFetcher.updateTask(toDoItem);
    fetchList();
  }

  // Save new tasks
  void saveNewTask(title) async {
    ToDoItem newtoDoItem = ToDoItem(title);
    await internetFetcher.postTask(newtoDoItem);
    fetchList();
  }

  // Delete task
  void deleteTask(toDoItem) async {
    await internetFetcher.removeTask(toDoItem);
    fetchList();
  }

  // Filter
  String selectedFilter = '';

  String setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
    return selectedFilter;
  }

  List<ToDoItem> get toDoList {
    switch (selectedFilter) {
      case 'all':
        return _toDoList.toList();
      case 'done':
        return _toDoList
            .where((element) => element.taskCompleted == true)
            .toList();
      case 'undone':
        return _toDoList
            .where((element) => element.taskCompleted == false)
            .toList();
      default:
        return _toDoList.toList();
    }
  }
}
