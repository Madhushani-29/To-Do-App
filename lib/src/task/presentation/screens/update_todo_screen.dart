import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';
import 'package:todo/src/task/presentation/bloc/create_todo_bloc/create_todo_bloc.dart';

// ignore: must_be_immutable
class TodoUpdateScreen extends StatefulWidget {
  final String? title;
  final String? date;
  final String? status;
  String? priority;
  final String? id;

  TodoUpdateScreen({
    Key? key,
    this.title,
    this.date,
    this.status,
    this.priority,
    this.id,
  }) : super(key: key);

  @override
  State<TodoUpdateScreen> createState() => _TodoUpdateScreenState();
}

class _TodoUpdateScreenState extends State<TodoUpdateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _title;
  late String _date;
  late String _priority;
  late String _status;
  late String _id;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? "";
    _date = widget.date ?? "";
    _priority = widget.priority ?? "";
    _status = widget.status ?? "";
    _id = widget.id ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CreateTodoBloc, CreateTodoState>(
        listener: (context, state) {
          if (state is TodoCreatedSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.successSnackBarColor,
              showCloseIcon: true,
            ));
          }
          if (state is TodoCreateFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.failureSnackBarColor,
              showCloseIcon: true,
            ));
          }
        },
        builder: (context, state) {
          if (state is CreateTodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
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
                      initialValue: widget.title,
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
                      initialValue: widget.date,
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
                        hint: Text(
                          _priority,
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
                        onChanged: (value) {
                          setState(() {
                            _priority = value!;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TodoData todo = TodoData(
                          id: _id,
                          title: _title,
                          date: _date,
                          priority: _priority,
                          status: _status,
                        );
                        await FirebaseFirestore.instance
                            .collection('todos')
                            .doc(todo.id)
                            .update(todo.toJson());
                      },
                      child: const Text("Update"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
