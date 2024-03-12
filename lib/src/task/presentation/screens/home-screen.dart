import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/screens/add_todo_screen.dart';
import 'package:todo/src/task/presentation/widgets/home-appbar.dart';
import 'package:todo/src/task/presentation/widgets/task-tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //QuerySnapshot: Represents a snapshot of query results from Firestore.
  //It contains zero or more DocumentSnapshot objects.
  //<Map<String, dynamic>>: Indicates that the QuerySnapshot contains maps
  //where the keys are String and the values are dynamic types
  final Stream<QuerySnapshot<Map<String, dynamic>>> todosStream =
      FirebaseFirestore.instance.collection('todos').snapshots();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.homeTitle,
                style: TextStyle(
                    color: AppColors.pageTitleFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
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
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 23,
                        width: 80,
                        padding: const EdgeInsets.only(left: 5, right: 5),
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
                        maxHeight: 150,
                        width: 80,
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
                        height: 20,
                        padding: EdgeInsets.only(left: 5, right: 5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 23,
                    width: 90,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonBackgroundColor,
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AppColors.buttonBorderColor, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 12,
                        color: AppColors.primaryButtonIconColor,
                      ),
                      label: const Text(
                        AppStrings.dateFilterButtonText,
                        style: TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ButtonsTabBar(
                  physics: const BouncingScrollPhysics(),
                  contentPadding: const EdgeInsets.only(
                    right: 10,
                  ),
                  backgroundColor: AppColors.primaryBackgroundColor,
                  labelStyle: const TextStyle(
                    backgroundColor: AppColors.primaryBackgroundColor,
                    color: AppColors.activeTabFontColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    backgroundColor: AppColors.primaryBackgroundColor,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedBackgroundColor: AppColors.primaryBackgroundColor,
                  tabs: const [
                    Tab(
                      text: AppStrings.tabTitleTodo,
                    ),
                    Tab(text: AppStrings.tabTitleCompleted)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29, right: 29, top: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 250,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: todosStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(height:50, child: const CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null ||
                          snapshot.data!.docs.isEmpty) {
                        // corrected condition
                        return Text('No todos found.');
                      } else {
                        final todos = snapshot.data!.docs
                            .map((doc) => doc.data() as Map<String, dynamic>)
                            .toList();
                        final completedTasks = todos
                            .where((task) => task['status'] == 'completed')
                            .toList();
                        final pendingTasks = todos
                            .where((task) => task['status'] == 'pending')
                            .toList();
                        return TabBarView(children: <Widget>[
                          ListView.builder(
                            itemCount: pendingTasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              var task = pendingTasks[index];
                              return TaskTile(
                                  taskID: task['id'],
                                  title: task['title'],
                                  date: task['date'],
                                  priority: task['priority'],
                                  status: task['status']);
                            },
                          ),
                          ListView.builder(
                            itemCount: completedTasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              var task = completedTasks[
                                  index]; // corrected variable assignment
                              return TaskTile(
                                  taskID: task['id'],
                                  title: task['title'],
                                  date: task['date'],
                                  priority: task['priority'],
                                  status: task['status']);
                            },
                          ),
                        ]);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 57,
          color: AppColors.primaryBackgroundColor,
          width: double.infinity,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 27.5),
                child: Divider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
              ),
              Center(
                child: FloatingActionButton(
                  backgroundColor: AppColors.secondaryButtonBackgroundColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TodoCreateScreen()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 35,
                    color: AppColors.secondaryButtonIconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
