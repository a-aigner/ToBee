import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.deepOrange.shade100,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
