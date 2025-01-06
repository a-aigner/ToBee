import 'package:flutter/material.dart';
import 'package:to_bee/views/on_boarding2.dart';
import 'package:to_bee/views/welcome.dart';

class OnBoarding3 extends StatefulWidget {
  const OnBoarding3({super.key});

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset("lib/assets/images/Task-bro1.png"),
          const SizedBox(height: 10),
          const SizedBox(
            width: 304,
            height: 78,
            child: Column(
              children: [
                Text(
                  "Creating your first",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  "ToDo list!",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 365,
            height: 108,
            child: Column(
              children: [
                Text(
                  "ToDo helps you organize ",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "your day and achive your",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "goals effortlessly.",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoarding2()));
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 40,
                    color: Color(0xffFE6C00),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Welcome()),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    size: 40,
                    color: Color(0xffFE6C00),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
