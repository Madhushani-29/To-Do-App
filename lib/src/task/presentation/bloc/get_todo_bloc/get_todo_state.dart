part of 'get_todo_bloc.dart';

sealed class GetTodoState extends Equatable {
  const GetTodoState();
  
  @override
  List<Object> get props => [];
}

final class GetTodoInitial extends GetTodoState {}
