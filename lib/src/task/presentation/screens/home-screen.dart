import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
import 'package:todo/src/task/presentation/widgets/home-appbar.dart';
import 'package:todo/src/task/presentation/widgets/task-list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "completed"
    },
    {
      'title': 'Review Project Requirements',
      'date': '2024-02-27',
      'priority': 'Medium',
      "status": "completed"
    },
    {
      'title': 'Team Discussion',
      'date': '2024-02-22',
      'priority': 'High',
      "status": "pending"
    },
    {
      'title': 'User Interview',
      'date': '2024-02-25',
      'priority': 'Low',
      "status": "completed"
    },
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "pending"
    },
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "completed"
    },
    {
      'title': 'Review Project Requirements',
      'date': '2024-02-27',
      'priority': 'Medium',
      "status": "completed"
    },
    {
      'title': 'Team Discussion',
      'date': '2024-02-22',
      'priority': 'High',
      "status": "pending"
    },
    {
      'title': 'User Interview',
      'date': '2024-02-25',
      'priority': 'Low',
      "status": "completed"
    },
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "pending"
    },
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "completed"
    },
    {
      'title': 'Review Project Requirements',
      'date': '2024-02-27',
      'priority': 'Medium',
      "status": "completed"
    },
    {
      'title': 'Team Discussion',
      'date': '2024-02-22',
      'priority': 'High',
      "status": "pending"
    },
    {
      'title': 'User Interview',
      'date': '2024-02-25',
      'priority': 'Low',
      "status": "completed"
    },
    {
      'title': 'Daily Scrum Meeting',
      'date': '2024-02-26',
      'priority': 'High',
      "status": "pending"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29, vertical: 10),
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
                    SizedBox(
                      height: 23,
                      width: 90,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryButtonBackgroundColor,
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
                          color: AppColors.buttonIconColor,
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
                    height: MediaQuery.of(context).size.height - 193,
                    child: TabBarView(children: <Widget>[
                      TaskList(
                          data: data
                              .where((task) => task['status'] == 'pending')
                              .toList()),
                      TaskList(
                          data: data
                              .where((task) => task['status'] == 'completed')
                              .toList()),
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
