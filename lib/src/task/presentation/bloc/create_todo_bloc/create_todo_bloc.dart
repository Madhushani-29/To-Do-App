import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/src/task/domain/usecases/create_todo.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  final CreateTodo createTodo;
  CreateTodoBloc({required this.createTodo}) : super(CreateTodoInitial()) {
    on<CreateTodos>((event, emit) async {
      final todoData = event.todo;
      final todo = todoData.toEntity();
      final failureOrSuccess = await createTodo(todo);
      failureOrSuccess.fold(
          (failure) => emit(TodoCreateFailed(message: "Something went wrong")),
          (success) => emit(
              TodoCreatedSuccessful(message: "Todo created successfully")));
    });
  }
}
