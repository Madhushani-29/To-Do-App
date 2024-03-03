import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart';
import 'package:todo/src/task/data/models/todo-model.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource{
  @override
  Future<void> createTodo(TodoModel todo) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    // TODO: implement getAllTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}