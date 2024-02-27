import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List data;

  const TaskList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        var task = data[index];
        return Container(
          height: 72.7,
          color: Colors.amberAccent,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(" ${task["title"]}"),
                ],
              ),
              Row(
                children: [
                  Text(" ${task["date"]}"),
                  Text(" ${task["priority"]}"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
