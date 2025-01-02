import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/services/provider.dart';
import 'package:to_bee/views/add_task.dart';
import 'package:to_bee/views/pomodoro_timer_poage.dart';
import 'package:to_bee/views/pprofile.dart';
import 'package:to_bee/views/rewards.dart';
import 'package:to_bee/views/tasks.dart';
import 'package:to_bee/views/tasks2.dart';
import 'package:to_bee/views/home_page.dart';
import 'package:to_bee/views/task_deadlines_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // For TaskProvider
import 'package:to_bee/services/provider.dart'; // Task state management
import 'package:to_bee/views/tasks.dart'; // TasksScreen
import 'package:to_bee/views/task_deadlines_page.dart'; // TaskDeadlinesPage
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    PomodoroTimerPage(),
    RewardsPage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final items = <Widget>[
      Icon(Icons.home, size: 30),

      Icon(Icons.timer, size: 30),

      Icon(Icons.card_giftcard, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color:  Colors.white)),
        child: CurvedNavigationBar(
            key: navigationKey,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.black,
            buttonBackgroundColor: Colors.orange,
            height: 60,
            index: _selectedIndex,
            items: items,
            onTap: (index) => setState(() => this._selectedIndex = index)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0), // Space for the button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Container(
                    color: Color(0xffFFD3B2),
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 100),
                        Container(
                          width: 130.32,
                          height: 103.04,
                          child: Image.asset("lib/assets/images/Group305.png"),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 39,
                            height: 39,
                            child: Image.asset("lib/assets/images/mdi_bell-notification.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Daily Tasks
                  _buildSectionTitle('Daily Tasks'),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];
                        return _buildTaskCard(task.title, task.description, task.isCompleted, () {
                          taskProvider.toggleTaskCompletionAndDelete(index);
                        });
                      },
                    ),
                  ),
                  // All Tasks
                  _buildSectionTitle('All Tasks'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];
                        return _buildTaskCard(task.title, task.description, task.isCompleted, () {
                          taskProvider.toggleTaskCompletionAndDelete(index);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          // Fixed "Add Task" button
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskPage2()));
                },
                minWidth: 130,
                height: 47,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.orange, width: 3),
                ),
                child: Text("Add Task", style: TextStyle(color: Colors.orange)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper function for task cards
  Widget _buildTaskCard(String title, String description, bool isCompleted, VoidCallback onToggle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(description),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  isCompleted ? Icons.check_circle : Icons.check_circle_outline,
                  color: isCompleted ? Colors.green : Colors.grey,
                ),
                onPressed: onToggle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
