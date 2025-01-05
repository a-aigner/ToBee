import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/services/provider.dart';
import 'package:to_bee/views/pomodoro_timer_page.dart';
import 'package:to_bee/views/profile.dart';
import 'package:to_bee/views/rewards.dart';
import 'package:to_bee/views/tasks2.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:to_bee/views/notification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const PomodoroTimerPage(),
    const RewardsPage(),
    const NotificationPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, color: Colors.white, size: 35),
      const Icon(Icons.timer, color: Colors.orange, size: 35),
      const Icon(Icons.card_giftcard, color: Colors.deepPurple, size: 35),
      const Icon(Icons.notifications,
          color: Color.fromARGB(255, 250, 190, 10), size: 35),
      const Icon(Icons.person, color: Colors.deepOrange, size: 35),
    ];

    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          color: const Color.fromARGB(250, 25, 25, 25),
          height: 60,
          index: _selectedIndex,
          items: items,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 80.0), // Space for the button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Container(
                    width: 430,
                    height: 105,
                    decoration: const BoxDecoration(
                      color: Color(0xffFFD3B2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 100),
                          SizedBox(
                            width: 130,
                            height: 100,
                            child: Image.asset(
                              "lib/assets/images/Group305.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 25),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ),
                  // Daily Tasks
                  _buildSectionTitle('Daily Tasks'),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];
                        return _buildTaskCard(
                            task.title, task.description, task.isCompleted, () {
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
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.tasks[index];
                        return _buildTaskCard(
                            task.title, task.description, task.isCompleted, () {
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
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTaskPage2(),
                    ),
                  );
                },
                minWidth: 130,
                height: 40,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                child: const Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
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
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper function for task cards
  Widget _buildTaskCard(String title, String description, bool isCompleted,
      VoidCallback onToggle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xffFFD3B2),
          border: Border.all(color: Colors.orange, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
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
