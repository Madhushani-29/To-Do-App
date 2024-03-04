// Mocks generated by Mockito 5.4.4 from annotations
// in todo/test/data/repository/todo_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo/src/task/data/data_sources/todo_remote_data_source.dart'
    as _i2;
import 'package:todo/src/task/data/models/todo-model.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRemoteDataSource extends _i1.Mock
    implements _i2.TodoRemoteDataSource {
  @override
  _i3.Future<List<_i4.TodoModel>> getAllTodo() => (super.noSuchMethod(
        Invocation.method(
          #getAllTodo,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TodoModel>>.value(<_i4.TodoModel>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.TodoModel>>.value(<_i4.TodoModel>[]),
      ) as _i3.Future<List<_i4.TodoModel>>);

  @override
  _i3.Future<void> createTodo(_i4.TodoModel? todo) => (super.noSuchMethod(
        Invocation.method(
          #createTodo,
          [todo],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<void> updateTodo(_i4.TodoModel? todo) => (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<bool> deleteTodo(String? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [id],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
