part of 'create_todo_bloc.dart';

sealed class CreateTodoState {}

class CreateTodoInitial extends CreateTodoState {}

class TodoCreatedSuccessful extends CreateTodoState {
  final String message;

  TodoCreatedSuccessful({required this.message});
}

class TodoCreateFailed extends CreateTodoState {
  final String message;

  TodoCreateFailed({required this.message});
}
