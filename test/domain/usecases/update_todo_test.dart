import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';
import 'package:todo/src/task/domain/usecases/update_todo.dart';

import 'update_todo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late UpdateTodo usecase;
  late MockTodoRepository mockTodoRepository;

  Todo sampleTodo = Todo(
    id: 1,
    title: "Documentation",
    date: '2024-03-20',
    status: 'completed',
    priority: 'high',
  );
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = UpdateTodo(mockTodoRepository, sampleTodo);
  });

  test('should create a new todo', () async {
    // arrange
    when(mockTodoRepository.updateTodo(sampleTodo))
        .thenAnswer((_) async => Right<Failure, void>(Void));
    // act
    final result = await usecase(sampleTodo);
    // assert
    expect(result, Right(Void));
    verify(mockTodoRepository.updateTodo(sampleTodo));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}