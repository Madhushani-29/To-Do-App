import 'package:flutter/material.dart';

//https://pub.dev/packages/buttons_tabbar/install
//https://pub.dev/packages/calendar_date_picker2

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Home")],
      ),
    );
  }
}
