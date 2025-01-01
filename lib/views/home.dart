import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/services/provider.dart';
import 'package:to_bee/views/add_task.dart';
import 'package:to_bee/views/tasks2.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xffFFFfFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: 430,
              height: 130,
              color: Color(0xffFFD3B2),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 100),
                    Container(
                      width: 130.32,
                      height: 103.04,
                      child: Image.asset(
                        "lib/assets/images/Group305.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 28.5),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 39,
                        height: 39,
                        child: Image.asset(
                          "lib/assets/images/mdi_bell-notification.png",
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              ),
            ),
            // Daily Tasks Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Daily tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return _buildTaskCard(
                    task.title,
                    task.description,
                    task.isCompleted,
                    () => taskProvider.toggleTaskCompletionAndDelete(index),
                    () => taskProvider.deleteTask(index),
                  );
                },
              ),
            ),
            // Recommended Tasks Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommended tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Feature Coming Soon"),
                      content: Text("This feature might be implemented in a future update."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
                minWidth: 153,
                height: 47,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 3, color: Colors.orange),
                ),
                child: Text("Recommands", style: TextStyle(color: Colors.orange)),
              ),
            ),
            // All Tasks Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return _buildTaskCard(
                    task.title,
                    task.description,
                    task.isCompleted,
                    () => taskProvider.toggleTaskCompletionAndDelete(index),
                    () => taskProvider.deleteTask(index),
                  );
                },
              ),
            ),
            // Add Task Button
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 220),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddTaskPage2(),
                    ),
                  );
                },
                minWidth: 130,
                height: 47,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(width: 3, color: Colors.orange),
                ),
                child: Text("Add", style: TextStyle(color: Colors.orange)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build task cards
  Widget _buildTaskCard(
    String title,
    String description,
    bool isCompleted,
    VoidCallback? onToggle,
    VoidCallback? onDelete,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.orange),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isCompleted ? Icons.check_circle : Icons.check_circle_outline,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                  onPressed: onToggle,
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
