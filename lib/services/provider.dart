import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_bee/models/task_model.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // Fetch tasks from local storage
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      final List<dynamic> jsonTasks = json.decode(tasksString);
      _tasks = jsonTasks.map((json) => Task.fromJson(json)).toList();
    }
    notifyListeners();
  }

  // Add a task and save it to local storage
  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasks();
    notifyListeners();
  }

  // Delete a task and save changes to local storage
  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await _saveTasks();
    notifyListeners();
  }

  // Toggle task completion and save changes
  Future<void> toggleTaskCompletion(int index) async {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    await _saveTasks();
    notifyListeners();
  }

  void toggleTaskCompletionAndDelete(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();

    // If task is completed, delete it from the list
    if (_tasks[index].isCompleted) {
      Future.delayed(Duration(milliseconds: 500), () {
        deleteTask(index); // Automatically delete task after a short delay
      });
    }
  }

  // Save tasks to local storage
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonTasks =
        json.encode(_tasks.map((task) => task.toJson()).toList());
    prefs.setString('tasks', jsonTasks);
  }
}
