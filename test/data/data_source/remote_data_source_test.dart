import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/errors/server_exception.dart';
import 'package:todo/core/errors/server_failure.dart';
import 'package:todo/src/task/data/data_sources/remote_data_sources/todo_remote_data_source_impl.dart';
import 'package:todo/src/task/data/models/todo-model.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([FirebaseFirestore])
void main() {
  late FirebaseTodoRemoteDataSourceImpl dataSource;
  late MockFirebaseFirestore mockFirestore;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    dataSource = FirebaseTodoRemoteDataSourceImpl(firestore: mockFirestore);
  });

  final todo = TodoModel(
        id: '1',
        title: 'Todo 1',
        date: '2024-03-04',
        priority: 'High',
        status: 'pending',
      );

  group('createTodo', () {
    test('should create a new todo from remote data source', () async {
  when(mockFirestore.collection('todos').add(todo.toJson()))
      .thenAnswer((_) async => );

  final result = await dataSource.createTodo(todo);

  verifyNever(mockFirestore.collection('todos').add(todo.toJson()));

  expect(result, void());
});

   /* test('should throw a ServerException when the call to Firestore fails',
        () async {
      // Arrange
      final todo = TodoModel(
        id: '1',
        title: 'Todo 1',
        date: '2024-03-04',
        priority: 'High',
        status: 'pending',
      );
      when(mockFirestore.collection('todos').add(todo.toJson()))
          .thenThrow(Exception());

      // Act & Assert
      expect(
          () => dataSource.createTodo(todo), throwsA(isA<ServerException>()));
    });*/
  });
}
