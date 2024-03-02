import 'package:dartz/dartz.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart';
import 'package:todo/src/task/data/models/todo-model.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, void>> createTodo(Todo todo) async {
    try {
      await remoteDataSource.createTodo(todo.toModel());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Server Failure"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTodo(int id) async {
    try {
      final bool isDeleted = await remoteDataSource.deleteTodo(id);
      return Right(isDeleted);
    } catch (e) {
      return Left(ServerFailure("Server Failure"));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAllTodo() async {
    try {
      final List<TodoModel> todoModels = await remoteDataSource.getAllTodo();
      final List<Todo> todos =
          todoModels.map((model) => model.toEntity()).toList();
      return Right(todos);
    } catch (e) {
      return Left(ServerFailure("Server Failure"));
    }
  }

  @override
  @override
  Future<Either<Failure, void>> updateTodo(Todo todo) async {
    try {
      await remoteDataSource.updateTodo(todo.toModel());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Server Failure"));
    }
  }
}
