import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';
import 'package:todo/src/task/presentation/bloc/todo_bloc/todo_bloc.dart';

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
    final createTodoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<TodoBloc, TodoState>(
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
        child: ListView(
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
                      hint: const Text(
                        AppStrings.dropDownButtonText,
                        style: TextStyle(
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
                          _priority = value;
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
                        width: MediaQuery.of(context).size.width - 32,
                        maxHeight: 140,
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
                          height: 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.filledButtonBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
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
          child: const Text(
            AppStrings.createButtonHint,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.filledButtonFontColor),
          ),
        ),
      ),
    );
  }
}
