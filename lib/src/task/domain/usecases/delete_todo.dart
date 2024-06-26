// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;
  final String id;

  DeleteTodo(this.repository, this.id);

  Future<Either<Failure, bool>> call(String id) async {
    return repository.deleteTodo(id);
  }
}
