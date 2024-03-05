import 'package:equatable/equatable.dart';
import 'package:todo/src/task/data/models/todo-model.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';

class Todo extends Equatable {
  final String id;
  final String title;
  final String date;
  final String status;
  final String priority;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.status,
      required this.priority});

  TodoModel toModel() {
    return TodoModel(
      id: id,
      title: title,
      date: date,
      status: status,
      priority: priority,
    );
  }

  TodoData toTodoData() {
    return TodoData(
      id: id,
      title: title,
      date: date,
      status: status,
      priority: priority,
    );
  }

  @override
  List<Object?> get props => [id, title, date, status, priority];
}
