import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/core/constants/strings.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ButtonsTabBar(
                    physics: const BouncingScrollPhysics(),
                    contentPadding: const EdgeInsets.only(right: 10),
                    backgroundColor: AppColors.primaryBackground,
                    labelStyle: const TextStyle(
                      backgroundColor: AppColors.primaryBackground,
                      color: AppColors.activeTabFontColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      backgroundColor: AppColors.primaryBackground,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedBackgroundColor: AppColors.primaryBackground,
                    tabs: const [
                      Tab(
                        text: AppStrings.tabTitleTodo,
                      ),
                      Tab(text: AppStrings.tabTitleCompleted)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 50,
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
