import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';

class GetAllTodo {
  final TodoRepository repository;

  GetAllTodo(
    this.repository,
  );

  Stream<Either<Failure, List<TodoData>>> call() {
    return repository.getAllTodoStream().map(
          (eitherListTodo) => eitherListTodo.map(
            (listTodo) => listTodo
                .map(
                  (todo) => todo.toTodoData(),
                )
                .toList(),
          ),
        );
  }
}
