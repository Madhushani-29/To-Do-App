// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/movie_repository.dart';

class GetAllTodo {
  final MovieRepository repository;

  GetAllTodo(
    this.repository,
  );

  Future<Either<Failure, List<Todo>>> call() async {
    return repository.getAllTodo();
  }
}
