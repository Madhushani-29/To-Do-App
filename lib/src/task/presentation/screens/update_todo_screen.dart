import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/gen/assets.gen.dart';
import 'package:todo/src/task/presentation/Models/todo.dart';
import 'package:todo/src/task/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:intl/intl.dart';

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

  late DateTime now;
  late DateFormat formatter;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? "";
    _date = widget.date ?? DateTime.now().toString();

    _priority = widget.priority ?? "";
    _status = widget.status ?? "";
    _id = widget.id ?? "";

    now = DateTime.now();
    formatter = DateFormat('E, d MMM y', 'en');
    formattedDate = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
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
            const Text(AppStrings.updateTitle,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            const SizedBox(height: 33),
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
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: widget.title,
                    autovalidateMode: AutovalidateMode.always,
                    style: const TextStyle(fontSize: 14),
                    autofocus: true,
                    cursorColor: AppColors.textFieldCursorColor,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsetsDirectional.only(start: 29),
                      hintText: AppStrings.titleTextboxHint,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor, width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _title = text;
                      });
                    },
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    AppStrings.dateLabel,
                    style: TextStyle(
                        color: AppColors.tertiaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    autovalidateMode: AutovalidateMode.always,
                    style: const TextStyle(fontSize: 14),
                    autofocus: true,
                    cursorColor: AppColors.textFieldCursorColor,
                    decoration: InputDecoration(
                      suffixIconConstraints:
                          BoxConstraints.tight(const Size(26, 26)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: SvgPicture.asset(
                            Assets.icons.calenderIcon,
                            color: AppColors.primaryButtonIconColor,
                          ),
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.parse(_date),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                                    
                            if (selectedDate != null) {
                              setState(() {
                                _date = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              });
                            }
                          },
                        ),
                      ),
                      contentPadding:
                          const EdgeInsetsDirectional.only(start: 29),
                      hintText: _date,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textFieldBorderColor,
                            width: 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 26),
                  const Text(
                    AppStrings.priorityLabel,
                    style: TextStyle(
                        color: AppColors.tertiaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        _priority,
                        style: const TextStyle(
                          fontSize: 14,
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
                                    fontSize: 14,
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
          onPressed: () async {
            TodoData todo = TodoData(
              id: _id,
              title: _title,
              date: _date,
              priority: _priority,
              status: _status,
            );
            try {
              await FirebaseFirestore.instance
                  .collection('todos')
                  .doc(todo.id)
                  .update(todo.toJson());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.successSnackBarColor,
                  content: Text('Todo updated successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.failureSnackBarColor,
                  content: Text('Todo update failed'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: const Text(
            AppStrings.updateButtonText,
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
