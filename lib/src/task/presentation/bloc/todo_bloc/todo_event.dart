part of 'todo_bloc.dart';

sealed class TodoCreateEvent {}

class CreateTodos extends TodoCreateEvent {
  final TodoData todo;

  CreateTodos({required this.todo});
  @override
  List<Object?> get props => [todo];
}
