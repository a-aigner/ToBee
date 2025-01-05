import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/models/task_model.dart';
import '../services/provider.dart';

String token =
    "CfDJ8GYzjPyrj9RJseswFZGYVpqTiff1PWfNOdLeQxw5qX8A9qhw_8Y_-YVfiVfWoZWJYugQXu5aR-iSuROdurT71q8AJwDD08u3mOnCbFAUGfkjBHEdNqLJ0hrIBMI9qH4-zZ2E5ACLGLlu1OD0KFzl_p6M2S8YMVI5P34DgkoSXFC55K2MdxDV7Rl0kO8uQoK4vkOVDYJOunUp-qPK_edzRZi8NnbrlPRgfVToBnNJWoVC1S3IHDyBUHDO1qjilDkCdKFesRVMP-D2EehkMks6W8VUzs43X_86KRjWkOwrZsWIBZBe5ZHRQQWERdrcrnGMdjosp8JAcjhv4nBSv_y_rD7_hJxamufZgMfseD4pEeWEjr1BDicngL92fjKzPXmMsjhFFRatJvItdv4WlMCK5za1ug5wW_EEwd6J2em3wcDEmHD7r42vdjFenBH05qgfjahKhA0Hvro0cWt7Q-9kQ9h6DkcE2tLiEvVqIe3NDEo2NNAV-kNPZwQdVsykarXnHMSvb0uAQChhAfu4wHemEJkJnVUBM-SwfVMs26YRYsdddBxb8Z_VhcNnONzA98sOYbcuh58NEhq_o-OijGIqvVt1CFrwwcIWq1BCcv_1AWgAwz7DAiHtbKZifAxn5VQAjHKX7bl-8DTrP2k_ZU2e5o0aXMjSS1Pdv4IOLBBIZILs";

class AddTaskPage2 extends StatefulWidget {
  const AddTaskPage2({super.key});

  // Callback for adding a task

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskPageState2 createState() => _AddTaskPageState2();
}

class _AddTaskPageState2 extends State<AddTaskPage2> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;
  String? _selectedSubject;

  final List<String> _subjects = ['Math', 'Science', 'History', 'Art', 'Music'];

  // Function to pick the start date
  Future<void> _pickStartDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

// Function to pick the start time
  Future<void> _pickStartTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

// Function to pick the end date
  Future<void> _pickEndDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

// Function to pick the end time
  Future<void> _pickEndTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  String _selectedValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: const Color(0xffFFD3B2),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined,
                  color: Colors.black, size: 40),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DropdownButton<String>(
                            value: _selectedValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.grey,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue!;
                              });
                            },
                            items: <String>['Select', 'Low', 'medium', 'High']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        // Date picker
                        ListTile(
                          leading: const Icon(Icons.date_range),
                          title: Text(
                            _startDate == null
                                ? 'Start Date'
                                : DateFormat.yMMMd().format(_startDate!),
                          ),
                          onTap: _pickStartDate,
                        ),
                        const SizedBox(height: 16),
                        // Time picker
                        ListTile(
                          leading: const Icon(Icons.access_time),
                          title: Text(
                            _startTime == null
                                ? 'Start Time'
                                : _startTime!.format(context),
                          ),
                          onTap: _pickStartTime,
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          leading: const Icon(Icons.date_range),
                          title: Text(
                            _endDate == null
                                ? 'End Date'
                                : DateFormat.yMMMd().format(_endDate!),
                          ),
                          onTap: _pickEndDate,
                        ),
                        const SizedBox(height: 16),
                        // Time picker
                        ListTile(
                          leading: const Icon(Icons.access_time),
                          title: Text(
                            _endTime == null
                                ? 'End Time'
                                : _endTime!.format(context),
                          ),
                          onTap: _pickEndTime,
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: MaterialButton(
                                  color: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  onPressed: submitData,
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar(); //new

    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future addTask() async {
    final Dio dio = Dio();
    final title = _titleController.text.toString();
    final description = _descriptionController.text.toString();
    print(title);
    print(description);
    String url = 'http://tobee.runasp.net/api/TaskService';
    final body = {
      "taskName": title,
      "taskDescription": description,
      "priorityLevel": "Low",
      "deadline": "2023-10-31T23:59:59Z",
      "status": "Pending",
      "createdAt": "2023-03-01T00:00:00Z",
      "completedAt": null
    };

    print("body is $body");

    final response = await dio.post(
      url,
      data: body,
    );
    if (response.statusCode == 201) {
      print('success');
      showSuccessMessage('creation success');
    } else {
      print('creation failed');
    }
  }

  Future<void> submitData() async {
    final title = _titleController.text.toString();
    final description = _descriptionController.text.toString();

    if (title.isNotEmpty && description.isNotEmpty) {
      final task = Task(
        title: title,
        description: description,
        isCompleted: false,
      );

      // Save task locally using TaskProvider
      Provider.of<TaskProvider>(context, listen: false).addTask(task);

      // Show success message and navigate back
      showSuccessMessage('Task added successfully!');
      Navigator.pop(context);
    } else {
      // Show error message if fields are empty
      showSuccessMessage('Please fill in all fields!');
    }
  }
}
