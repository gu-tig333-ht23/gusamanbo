import 'dart:convert';
import 'package:http/http.dart' as http;
import 'state.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String todoApiKey = '9e59be0b-246a-4e3f-8875-9247b843ae59';

class InternetFetcher {
  // Get data from API

  static Future<List<ToDoItem>> fetchData() async {
    Uri url = Uri.parse('$ENDPOINT/todos?key=$todoApiKey');

    http.Response response = await http.get(url);
    String body = response.body;

    List<dynamic> jsonResponse = jsonDecode(body);
    List<ToDoItem> toDoItem =
        jsonResponse.map((json) => ToDoItem.fromJson(json)).toList();

    return toDoItem;
  }

  // Post data to API

  Future<void> postTask(ToDoItem toDoItem) async {
    await http.post(
      Uri.parse('$ENDPOINT/todos?key=$todoApiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(toDoItem.toJson()),
    );
  }

  // Delete data in API

  Future<void> removeTask(toDoItem) async {
    var id = toDoItem.id;
    await http.delete(Uri.parse('$ENDPOINT/todos/$id?key=$todoApiKey'));
  }

  // Update tasks (checkbox)
  Future<void> updateTask(ToDoItem toDoItem) async {
    var id = toDoItem.id;
    await http.put(Uri.parse('$ENDPOINT/todos/$id?key=$todoApiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(toDoItem.toJson()));
  }
}
