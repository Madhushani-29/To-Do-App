// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/repositories/movie_repository.dart';

class DeleteTodo {
  final MovieRepository repository;
  final int id;

  DeleteTodo(this.repository, this.id);

  Future<Either<Failure, bool>> call() async {
    return repository.deleteTodo(id);
  }
}
