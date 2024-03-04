import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_todo_event.dart';
part 'delete_todo_state.dart';

class DeleteTodoBloc extends Bloc<DeleteTodoEvent, DeleteTodoState> {
  DeleteTodoBloc() : super(DeleteTodoInitial()) {
    on<DeleteTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
