import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_bee/services/timer_provider.dart';

class PomodoroTimerPage extends StatefulWidget {
  const PomodoroTimerPage({Key? key}) : super(key: key);

  @override
  State<PomodoroTimerPage> createState() => _PomodoroTimerPageState();
}

class _PomodoroTimerPageState extends State<PomodoroTimerPage> {
  // Toggle for showing the 5-sec test button
  bool _enable5SecTest = true;

  // True = "Work Session", False = "Break"
  bool _isWorkInterval = true;

  @override
  Widget build(BuildContext context) {
    final timerProv = context.watch<TimerProvider>();
    final formattedTime = timerProv.formatTime(timerProv.remainingSeconds);

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange.shade100,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Pomodoro Timer',
              style: TextStyle(
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
          children: [
            // Timer display
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Current time + label
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(_isWorkInterval ? 'Work Session' : 'Break'),
                    ],
                  ),
                  // Timer controls
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          timerProv.isRunning ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          if (timerProv.isRunning) {
                            timerProv.pauseTimer();
                          } else {
                            timerProv.startTimer();
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.stop, color: Colors.black),
                        onPressed: () {
                          timerProv.resetTimer();
                          setState(() {
                            _isWorkInterval = true;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Buttons to set timer
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_enable5SecTest) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade100,
                    ),
                    onPressed: () {
                      timerProv.setTimerSeconds(5);
                      setState(() {
                        _isWorkInterval = true;
                      });
                    },
                    child: const Text(
                      '5 sec test',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
                  ),
                  onPressed: () {
                    timerProv.setTimerMinutes(5);
                    setState(() {
                      _isWorkInterval = false;
                    });
                  },
                  child: const Text(
                    '5 min short break',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
                  ),
                  onPressed: () {
                    timerProv.setTimerMinutes(15);
                    setState(() {
                      _isWorkInterval = false;
                    });
                  },
                  child: const Text(
                    '15 min long break',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
                  ),
                  onPressed: () {
                    timerProv.setTimerMinutes(30);
                    setState(() {
                      _isWorkInterval = false;
                    });
                  },
                  child: const Text(
                    '30 min longer break',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade100,
                  ),
                  onPressed: () {
                    timerProv.setTimerMinutes(25);
                    setState(() {
                      _isWorkInterval = true;
                    });
                  },
                  child: const Text(
                    '25 min productive time',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
