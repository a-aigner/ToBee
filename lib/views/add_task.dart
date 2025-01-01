import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/models/task_model.dart';
import 'package:to_bee/services/provider.dart';

class AddTaskPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final title = _titleController.text;
                final description = _descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  final task = Task(
                    title: title,
                    description: description,
                    isCompleted: false,
                  );

                  // Add task via Provider
                  await Provider.of<TaskProvider>(context, listen: false).addTask(task);

                  // Return to previous screen
                  Navigator.pop(context);
                }
              },
              child: Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
