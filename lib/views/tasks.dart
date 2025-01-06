import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/models/task_model.dart';
import 'package:to_bee/views/home.dart';

import '../services/provider.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  // Callback for adding a task

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedSubject;

  final List<String> _subjects = ['Math', 'Science', 'History', 'Art', 'Music'];

  // Function to show date picker
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to show time picker
  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFD3B2),
        title: const Text(
          "add tasks",
          style: TextStyle(
            color: Color(0xff29221D),
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined,
              color: Colors.orange, size: 40),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
            // Back button functionality
          },
        ),
      ),
      body: Container(
        width: 430,
        height: 614,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xffFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Title input
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                // Description input
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                // Date picker
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat.yMMMd().format(_selectedDate!),
                  ),
                  onTap: _pickDate,
                ),
                const SizedBox(height: 16),
                // Time picker
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text(
                    _selectedTime == null
                        ? 'Select Time'
                        : _selectedTime!.format(context),
                  ),
                  onTap: _pickTime,
                ),
                const SizedBox(height: 16),
                // Subject dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    prefixIcon: Icon(Icons.book),
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedSubject,
                  items: _subjects
                      .map((subject) => DropdownMenuItem<String>(
                            value: subject,
                            child: Text(subject),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSubject = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: SizedBox(
                    width: 100,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        if (_titleController.text.isNotEmpty &&
                            _descriptionController.text.isNotEmpty) {
                          Provider.of<TaskProvider>(context, listen: false)
                              .addTask(
                            Task(
                              title: _titleController.text,
                              description: _descriptionController.text,
                            ),
                          );
                          Navigator.pop(
                            context,
                          ); // Go back to the previous page
                        }
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
