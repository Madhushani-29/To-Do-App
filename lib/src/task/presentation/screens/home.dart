import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo/core/constants/color.dart';
import 'package:todo/src/task/presentation/widgets/task-list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> data = [
    {'title': 'Daily Scrum Meeting', 'date': '2024-02-26', 'priority': 'High'},
    {
      'title': 'Review Project Requirements',
      'date': '2024-02-27',
      'priority': 'Medium'
    },
    {'title': 'Team Discussion', 'date': '2024-02-26', 'priority': 'High'},
    {'title': 'User Interview', 'date': '2024-02-27', 'priority': 'Low'},
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
                    tabs: [
                      Tab(
                        text: "All",
                      ),
                      Tab(text: "Completed")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        50, // Adjust the height as needed
                    child: TabBarView(children: <Widget>[
                      TaskList(data: data),
                      TaskList(data: data),
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
