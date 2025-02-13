import 'package:flutter/material.dart';
import 'package:to_bee/views/on_boarding1.dart';
import 'package:to_bee/views/on_boarding3.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({super.key});

  @override
  State<OnBoarding2> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Image.asset("lib/assets/images/Group311.png"),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
              width: 304,
              height: 78,
              child: Column(
                children: [
                  Text(
                    "Recommendations",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    "for you!",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: 365,
            height: 108,
            child: Column(
              children: [
                Text(
                  "Our app will suggest tasks",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "based on your tasks and",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "priorities.",
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
                        builder: (context) => const OnBoarding1(),
                      ),
                    );
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
                      MaterialPageRoute(
                        builder: (context) => const OnBoarding3(),
                      ),
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
