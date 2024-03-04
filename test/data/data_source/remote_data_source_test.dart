import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/errors/server_exception.dart';
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

  group('createTodo', () {
    test('should create a todo model when the call to Firestore is successful',
        () async {
      // Arrange
      final todo = TodoModel(
        id: '1',
        title: 'Todo 1',
        date: '2024-03-04',
        priority: 'High',
        status: 'pending',
      );

      // Act
      await dataSource.createTodo(todo);

      // Assert
      verify(mockFirestore.collection('todos').add(todo.toJson()));
    });

    test('should throw a ServerException when the call to Firestore fails',
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
    });
  });
}
