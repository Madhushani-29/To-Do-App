import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Todo>>> getAllTodo();
  Future<Either<Failure, void>> createTodo(Todo todo);
  Future<Either<Failure, void>> updateTodo(Todo todo);
  Future<Either<Failure, bool>> deleteTodo(int id);
}