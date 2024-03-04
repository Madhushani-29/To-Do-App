// Mocks generated by Mockito 5.4.4 from annotations
// in todo/test/domain/usecases/delete_todo.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo/core/errors/server_failure.dart' as _i5;
import 'package:todo/src/task/domain/entities/todo.dart' as _i6;
import 'package:todo/src/task/domain/repositories/todo_repository.dart' as _i3;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i3.TodoRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Todo>>> getAllTodo() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllTodo,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Todo>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Todo>>(
          this,
          Invocation.method(
            #getAllTodo,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Todo>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Todo>>(
          this,
          Invocation.method(
            #getAllTodo,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Todo>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> createTodo(_i6.Todo? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTodo,
          [todo],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #createTodo,
            [todo],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #createTodo,
            [todo],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> updateTodo(_i6.Todo? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [todo],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #updateTodo,
            [todo],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, void>>.value(
                _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #updateTodo,
            [todo],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> deleteTodo(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteTodo,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #deleteTodo,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #deleteTodo,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
