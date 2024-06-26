// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;
  final Todo todo;
  UpdateTodo(
    this.repository,
    this.todo,
  );

  Future<Either<Failure, void>> call(Todo todo) async {
    return repository.updateTodo(todo);
  }
}
