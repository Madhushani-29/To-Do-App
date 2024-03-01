// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/movie_repository.dart';

class CreateTodo {
  final MovieRepository repository;
  final Todo todo;
  CreateTodo(
    this.repository,
    this.todo,
  );

  Future<Either<Failure, void>> call(Todo todo) async {
    return repository.createTodo(todo);
  }
}
