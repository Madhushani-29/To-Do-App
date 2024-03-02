import 'dart:core';
import 'package:todo/src/task/data/models/todo-model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getAllTodo();
  Future<void> createTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<bool> deleteTodo(int id);
}
