import 'package:flutter/material.dart';
import 'package:to_bee/views/home.dart';
//import 'package:to_bee/views/on_boarding.dart';
import 'package:to_bee/views/on_boarding1.dart';
//import 'package:to_bee/views/login_screen.dart';
//import 'package:to_bee/views/sign_up.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20),
          Container(
            width: 302,
            height: 309.51,
            child: Image.asset(
              "lib/assets/images/Group25.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 430,
            height: 378,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Color(0xffFFD3B2)),
            child: Column(
              children: [
                SizedBox(height: 50),
                const Text(
                  "Welcome",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  width: 365,
                  height: 108,
                  child: Column(
                    children: [
                      const Text(
                        "ToDo helps you organize \nyour day and achive your \ngoals effortlessly. ",
                        style: TextStyle(
                          color: Color(0xff707070),
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        size: 80,
                        color: Color(0xffFE6C00),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnBoarding1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFE6C00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        "Learn more",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    /*
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: MaterialButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                side: BorderSide(
                                    width: 2, color: Color(0xffFE6C00))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xffFE6C00)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: MaterialButton(
                            color: Color(0xffFE6C00),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                side: BorderSide(
                                    width: 2, color: Color(0xffFE6C00))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        */
                  ],
                ),
                //),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
