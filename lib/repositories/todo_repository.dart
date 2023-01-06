import 'dart:convert';

import 'package:flutter_application_todo/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoRepository {
  late SharedPreferences sharedPreferences;

  void saveTodoList(List<Todo> todos) {
    final jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
  }

  Future<List<Todo>> getAllTodos() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final todosJson = sharedPreferences.getString('todo_list') ?? '[]';
    final todosList = json.decode(todosJson) as List;
    return todosList.map((e) => Todo.fromJson(e)).toList();
  }
}
