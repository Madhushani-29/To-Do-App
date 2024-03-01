import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/domain/entities/todo.dart';
import 'package:todo/src/task/domain/repositories/todo_repository.dart';
import 'package:todo/src/task/domain/usecases/get_all_todo.dart';

import 'get_all_todo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late GetAllTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = GetAllTodo(mockTodoRepository);
  });

  final todoList = [
    Todo(
      id: 1,
      title: "Documentation",
      date: '2024-03-20',
      status: 'completed',
      priority: 'high',
    ),
    Todo(
      id: 2,
      title: "Testing",
      date: '2024-03-22',
      status: 'pending',
      priority: 'medium',
    ),
    Todo(
      id: 3,
      title: "Refactoring",
      date: '2024-03-25',
      status: 'in_progress',
      priority: 'low',
    )
  ];

  test('should get all the todos', () async {
    // arrange
    when(mockTodoRepository.getAllTodo())
        .thenAnswer((_) async => Right<Failure, List<Todo>>(todoList));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(todoList));
    verify(mockTodoRepository.getAllTodo());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
