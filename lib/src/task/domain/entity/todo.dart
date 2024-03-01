import 'package:equatable/equatable.dart';

class todo extends Equatable {
  final int id;
  final String title;
  final String date;
  final String status;
  final String priority;

  todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.status,
      required this.priority});

  @override
  List<Object?> get props => [id, title, date, status, priority];
}
