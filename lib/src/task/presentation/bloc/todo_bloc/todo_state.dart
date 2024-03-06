part of 'todo_bloc.dart';

sealed class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccessful extends TodoState {
  final String message;

  TodoSuccessful({required this.message});
}

class TodoFailed extends TodoState {
  final String message;

  TodoFailed({required this.message});
}
