import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';
import 'package:todo/src/task/presentation/bloc/create_todo_bloc/create_todo_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    final createTodoBloc = BlocProvider.of<CreateTodoBloc>(context);
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
                          TodoData todo = TodoData(
                            id: '',
                            title: _title ?? '',
                            date: _date ?? '',
                            priority: _priority ?? '',
                            status: 'pending',
                          );
                          createTodoBloc.add(CreateTodos(todo: todo));
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
