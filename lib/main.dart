import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/services/provider.dart';
import 'package:to_bee/views/home.dart';
import 'package:to_bee/views/on_boarding.dart';
import 'package:to_bee/views/pomodoro_timer.dart';
import 'package:to_bee/views/pomodoro_timer_page.dart';
import 'package:to_bee/views/tasks.dart';
import 'package:to_bee/views/tasks2.dart';
import 'package:to_bee/views/welcome.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
