import 'dart:async';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  final String taskTitle;
  final String taskDescription;

  const TimerPage(
      {super.key, required this.taskTitle, required this.taskDescription});

  @override
  // ignore: library_private_types_in_public_api
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Duration duration =
      const Duration(minutes: 25); // Default Pomodoro work duration
  late Timer timer;
  bool isRunning = false;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  // Start the timer
  void startTimer() {
    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration = duration - const Duration(seconds: 1);
        });
      } else {
        setState(() {
          isRunning = false;
          isCompleted = true;
          timer.cancel();
        });
      }
    });
  }

  // Pause the timer
  void pauseTimer() {
    setState(() {
      isRunning = false;
    });
    timer.cancel();
  }

  // Resume the timer
  void resumeTimer() {
    startTimer();
  }

  // Quit task
  void quitTask() {
    timer.cancel(); // Stop the timer
    Navigator.pop(context); // Navigate back to the previous screen
  }

  // Select Pomodoro duration (Work, Short Break, Long Break)
  void selectPomodoroDuration(String type) {
    setState(() {
      if (type == "Work") {
        duration = const Duration(minutes: 25);
      } else if (type == "Short Break") {
        duration = const Duration(minutes: 5);
      } else if (type == "Long Break") {
        duration = const Duration(minutes: 15);
      }
    });
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel(); // Cancel timer when leaving the screen
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            backgroundColor: Colors.orange.shade100,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange),
              onPressed: () {
                Navigator.pop(context);
                if (timer.isActive) {
                  timer.cancel(); // Stop the timer when going back
                }
              },
            ),
            centerTitle: true,
            title: Text(
              widget.taskTitle,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.taskDescription,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              isCompleted
                  ? "Completed!"
                  : isRunning
                      ? "In progress"
                      : "Paused",
              style: const TextStyle(fontSize: 20, color: Colors.orange),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: duration.inSeconds > 0
                      ? duration.inSeconds /
                          (25 * 60) // Adjust progress based on Pomodoro time
                      : 0.0,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                Text(
                  "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (!isRunning &&
                !isCompleted) // Show Pomodoro options before timer starts
              Column(
                children: [
                  const Text(
                    "Select Pomodoro Time:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => selectPomodoroDuration("Work"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text(
                              "Work (25 min)",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                selectPomodoroDuration("Short Break"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade300,
                            ),
                            child: const Text(
                              "Short Break (5 min)",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => selectPomodoroDuration("Long Break"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade400,
                        ),
                        child: const Text(
                          "Long Break (15 min)",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                  iconSize: 40,
                  color: Colors.orange,
                  onPressed: isRunning ? pauseTimer : startTimer,
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.stop),
                  iconSize: 40,
                  color: Colors.orange,
                  onPressed: quitTask,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
