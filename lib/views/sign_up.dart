//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:provider/single_child_widget.dart';
import 'package:to_bee/views/home_page.dart';
import 'package:to_bee/views/login_screen.dart';
//import 'package:to_bee/views/sign_up.dart';
import 'package:to_bee/views/welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC397),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcome()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text("Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 15),
                Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
            const SizedBox(height: 60),
            SingleChildScrollView(
              child: Container(
                width: 430,
                height: 568,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFAFAFA)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffE0E0E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: usernamecontroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 10, left: 10),
                            hintText: "  Username",
                            hintStyle: TextStyle(color: Color(0xff939393)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Container(
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffE0E0E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 10, left: 10),
                            hintText: "  Password",
                            hintStyle: TextStyle(color: Color(0xff939393)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Container(
                        width: 390,
                        height: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffE0E0E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: passwordcontroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 10, left: 10),
                            hintText: "  Re Password",
                            hintStyle: TextStyle(color: Color(0xff939393)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("----------------------"),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffEEEEEE),
                              ),
                              width: 133,
                              height: 43,
                              alignment: Alignment.center,
                              child: const Text("or register with"),
                            ),
                            const Text("----------------------"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 38,
                                height: 38,
                                child: Image.asset(
                                    "lib/assets/images/google-logo.jpg"),
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 38,
                                height: 38,
                                child: Image.asset(
                                    "lib/assets/images/facebook-logo.jpg"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 295,
                          height: 57,
                          child: MaterialButton(
                            color: const Color(0xffFE6C00),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              side: BorderSide(
                                width: 2,
                                color: Color(0xffFE6C00),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
