import 'package:bloc/bloc.dart';
import 'package:todo/src/task/domain/usecases/create_todo.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo createTodo;
  TodoBloc({required this.createTodo})
      : super(TodoInitial()) {
    on<CreateTodos>((event, emit) async {
      emit(TodoLoading());
      final todoData = event.todo;
      final todo = todoData.toEntity();
      final failureOrSuccess = await createTodo(todo);
      failureOrSuccess.fold(
          (failure) => emit(TodoFailed(message: "Something went wrong")),
          (success) =>
              emit(TodoSuccessful(message: "Todo created successfully")));
    });
  }
}
