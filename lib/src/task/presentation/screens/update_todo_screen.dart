import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';
import 'package:todo/src/task/presentation/bloc/todo_bloc/todo_bloc.dart';

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
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.successSnackBarColor,
              showCloseIcon: true,
            ));
          }
          if (state is TodoFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.failureSnackBarColor,
              showCloseIcon: true,
            ));
          }
        },
        builder: (context, state) {
          if (state is TodoLoading) {
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
                    const Text(
                      AppStrings.titleLabel,
                      style: TextStyle(
                          color: AppColors.tertiaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
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
                    const Text(
                      AppStrings.dateLabel,
                      style: TextStyle(
                          color: AppColors.tertiaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
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
                    const Text(
                      AppStrings.priorityLabel,
                      style: TextStyle(
                          color: AppColors.tertiaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          _priority,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: AppStrings.priorityListItems
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.buttonTextColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: _priority,
                        onChanged: (value) {
                          setState(() {
                            _priority = value!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 45,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 30, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.dropdownBorderColor,
                            ),
                            color: AppColors.primaryButtonBackgroundColor,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                          ),
                          iconSize: 12,
                          iconEnabledColor: AppColors.primaryButtonIconColor,
                          iconDisabledColor: AppColors.primaryButtonIconColor,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 140,
                          width: MediaQuery.of(context).size.width - 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.primaryButtonBackgroundColor,
                          ),
                          offset: const Offset(0, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(0),
                            thickness: MaterialStateProperty.all(5),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.only(left: 30, right: 20),
                          height:30
                        ),
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
                      child: const Text(AppStrings.updateButtonText),
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
