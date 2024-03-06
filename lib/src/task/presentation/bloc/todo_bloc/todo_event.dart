part of 'todo_bloc.dart';

sealed class TodoEvent {}

class CreateTodos extends TodoEvent {
  final TodoData todo;

  CreateTodos({required this.todo});
    @override
  List<Object?> get props => [todo];
}