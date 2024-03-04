part of 'delete_todo_bloc.dart';

sealed class DeleteTodoState extends Equatable {
  const DeleteTodoState();
  
  @override
  List<Object> get props => [];
}

final class DeleteTodoInitial extends DeleteTodoState {}
