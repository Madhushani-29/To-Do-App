import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo/core/constants/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 0),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonsTabBar(
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
                      tabs: [Tab(text: "All"), Tab(text: "Completed")],
                    ),
                    const SizedBox(
                      height: 500,
                      child: TabBarView(children: <Widget>[
                        Text("All"),
                        Text("Completed"),
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
