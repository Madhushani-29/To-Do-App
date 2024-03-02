import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<Either<Failure, void>> createTodo(Todo todo) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteTodo(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getAllTodo() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateTodo(Todo todo) {
    throw UnimplementedError();
  }
}
