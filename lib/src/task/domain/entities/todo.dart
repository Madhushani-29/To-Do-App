import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
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

  @override
  List<Object?> get props => [id, title, date, status, priority];
}
