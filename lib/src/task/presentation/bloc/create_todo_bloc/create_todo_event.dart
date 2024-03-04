part of 'create_todo_bloc.dart';

sealed class CreateTodoEvent {}

class CreateTodos extends CreateTodoEvent {
  final TodoData todo;

  CreateTodos({required this.todo});
    @override
  List<Object?> get props => [todo];
}
