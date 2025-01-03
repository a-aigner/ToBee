import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:to_bee/views/add_task.dart';
import 'package:to_bee/views/home1.dart';
import 'package:to_bee/views/home2.dart';
import 'package:to_bee/views/home_page.dart';
import 'package:to_bee/views/pomodoro_timer.dart';
import 'package:to_bee/views/pomodoro_timer_poage.dart';
import 'package:to_bee/views/pprofile.dart';
import 'package:to_bee/views/rewards.dart';
import 'package:to_bee/views/tasks.dart';

/// I put curvednavigationbar to navigate between screens.

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;
  bool INDEX = true;
  final screens = [
    TaskListPage2(),
    PomodoroTimerPage(),
    RewardsPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final items = <Widget>[
      Icon(Icons.home, color: Colors.white, size: 35),
      Icon(Icons.timer, color: Colors.orange, size: 35),
      Icon(Icons.card_giftcard, color: Colors.deepPurple, size: 35),
      Icon(Icons.person, color: Colors.deepOrange, size: 35),
    ];
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 300),
            color: const Color.fromARGB(250, 25, 25, 25),
            //buttonBackgroundColor: Colors.orange,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index)),
      ),
    );
  }
}
