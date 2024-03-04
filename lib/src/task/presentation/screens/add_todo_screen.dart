import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/constants/strings.dart';

class TodoCreateScreen extends StatefulWidget {
  const TodoCreateScreen({Key? key}) : super(key: key);

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _title;
  String? _date;
  String? _priority;

  Future createToDo(Map<String, dynamic> todoData) async {
    await FirebaseFirestore.instance.collection("todos").add(todoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  maxLength: 20,
                  decoration: const InputDecoration(hintText: "title"),
                  onChanged: (text) {
                    setState(() {
                      _title = text;
                    });
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  maxLength: 20,
                  decoration: const InputDecoration(hintText: "date"),
                  onChanged: (text) {
                    setState(() {
                      _date = text;
                    });
                  },
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: const Text(
                      "Select Priority",
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: AppStrings.priorityListItems
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: _priority,
                    onChanged: (value) {
                      setState(() {
                        _priority = value;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> todoData = {
                      "title": _title,
                      "date": _date,
                      "priority": _priority,
                      "status": "pending"
                    };
                    createToDo(todoData);
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
