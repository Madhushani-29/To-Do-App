import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';
import 'package:todo/src/task/domain/usecases/delete_todo.dart';

import 'delete_todo.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late DeleteTodo usecase;
  late MockTodoRepository mockTodoRepository;

  final String id = "2";

  final bool res = true;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = DeleteTodo(mockTodoRepository, id);
  });

  test('should create a new todo', () async {
    // arrange
    when(mockTodoRepository.deleteTodo(id))
        .thenAnswer((_) async => Right<Failure, bool>(res));
    // act
    final result = await usecase(id);
    // assert
    expect(result, Right(Void));
    verify(mockTodoRepository.deleteTodo(id));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
