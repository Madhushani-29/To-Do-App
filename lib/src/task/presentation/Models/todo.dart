// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo/src/task/domain/entities/todo.dart';

class TodoData {
  final String id;
  final String title;
  final String date;
  final String status;
  final String priority;
  TodoData({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
    required this.priority,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'status': status,
      'priority': priority,
    };
  }

  factory TodoData.fromJson(Map<String, dynamic> json) {
    return TodoData(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      status: json['status'],
      priority: json['priority'],
    );
  }

  Todo toEntity() {
    return Todo(
      id: id,
      title: title,
      date: date,
      status: status,
      priority: priority,
    );
  }
}
