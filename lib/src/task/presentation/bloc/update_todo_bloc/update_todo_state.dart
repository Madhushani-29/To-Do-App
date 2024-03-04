part of 'update_todo_bloc.dart';

sealed class UpdateTodoState extends Equatable {
  const UpdateTodoState();
  
  @override
  List<Object> get props => [];
}

final class UpdateTodoInitial extends UpdateTodoState {}
