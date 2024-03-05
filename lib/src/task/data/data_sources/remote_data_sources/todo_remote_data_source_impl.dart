import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/errors/server_exception.dart';
import 'package:todo/src/task/data/models/todo-model.dart';
import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart';

class FirebaseTodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final FirebaseFirestore firestore;

  FirebaseTodoRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<TodoModel>> getAllTodo() async {
    try {
      final querySnapshot = await firestore.collection('todos').get();
      return querySnapshot.docs
          .map((doc) => TodoModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to get todos from Firestore');
    }
  }

  @override
  Future<void> createTodo(TodoModel todo) async {
    // Add todo to Firestore and get the document reference
    final DocumentReference documentReference =
        await firestore.collection('todos').add(todo.toJson());
    // Get the ID of the added document and assign it to the todo model
    final String todoId = documentReference.id;
    todo.id = todoId;
    // Update the todo in Firestore with the newly assigned ID
    await documentReference.update({'id': todoId});
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    try {
      await FirebaseFirestore.instance
          .collection('todos')
          .doc(todo.id)
          .update(todo.toJson());
    } catch (e) {
      throw ServerException(message: 'Failed to update todo in Firestore');
    }
  }

  @override
  Future<bool> deleteTodo(String id) async {
    try {
      await firestore.collection('todos').doc(id).delete();
      return true;
    } catch (e) {
      throw ServerException(message: 'Failed to delete todo from Firestore');
    }
  }
}
