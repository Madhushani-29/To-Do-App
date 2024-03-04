import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc() : super(CreateTodoInitial()) {
    on<CreateTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
