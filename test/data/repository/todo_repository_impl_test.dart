import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/server_exception.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart';
import 'package:todo/src/task/data/models/todo-model.dart';
import 'package:todo/src/task/data/repositories/todo_repository_impl.dart';
import 'package:todo/src/task/domain/entities/todo.dart';

import 'todo_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRemoteDataSource>()])
void main() {
  late TodoRepositoryImpl repository;
  late MockTodoRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockTodoRemoteDataSource();
    repository = TodoRepositoryImpl(remoteDataSource: mockDataSource);
  });

  final todoModelList = [
    TodoModel(
      id: "1",
      title: "Documentation",
      date: '2024-03-20',
      status: 'completed',
      priority: 'high',
    ),
    TodoModel(
      id: "1",
      title: "Documentation",
      date: '2024-03-20',
      status: 'completed',
      priority: 'high',
    ),
  ];

  final todoModel = TodoModel(
    id: "1",
    title: "Documentation",
    date: '2024-03-20',
    status: 'completed',
    priority: 'high',
  );

  final todo = Todo(
    id: "1",
    title: "Documentation",
    date: '2024-03-20',
    status: 'completed',
    priority: 'high',
  );

  test('should get all todos from remote data source', () async {
    when(mockDataSource.getAllTodo())
        .thenAnswer((_) async => todoModelList);

    final result = await repository.getAllTodo();

    verify(mockDataSource.getAllTodo());

    expect(result, isA<Right<Failure, List<Todo>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    when(mockDataSource.getAllTodo()).thenThrow(ServerException());

    final result = await repository.getAllTodo();

    expect(result, isA<Left<ServerFailure, List<Todo>>>());
  });

test('should create a new todo from remote data source', () async {
  when(mockDataSource.createTodo(todoModel))
      .thenAnswer((_) async => const Right(null));

  final result = await repository.createTodo(todo);

  verifyNever(mockDataSource.createTodo(todoModel));

  expect(result, isA<Right<ServerFailure, void>>());
});


}
