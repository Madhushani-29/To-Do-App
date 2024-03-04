part of 'create_todo_bloc.dart';

sealed class CreateTodoState extends Equatable {
  const CreateTodoState();
  
  @override
  List<Object> get props => [];
}

final class CreateTodoInitial extends CreateTodoState {}
