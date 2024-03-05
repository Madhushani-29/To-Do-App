import 'dart:core';
import 'package:todo/src/task/data/models/todo-model.dart';

abstract class TodoRemoteDataSource {
  Stream<List<TodoModel>> getAllTodoStream();
  Future<void> createTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<bool> deleteTodo(String id);
}
