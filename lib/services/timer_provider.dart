import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;
  int _remainingSeconds = 25 * 60;
  bool _isRunning = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _isRunning;

  // Format seconds -> mm:ss
  String formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          notifyListeners();
        } else {
          // Timer done
          timer.cancel();
          _isRunning = false;
          notifyListeners();

          // Play the alarm
          _playAlarm();
        }
      });
      _isRunning = true;
      notifyListeners();
    }
  }

  void pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void resetTimer() {
    _timer?.cancel();
    _remainingSeconds = 25 * 60;
    _isRunning = false;
    notifyListeners();
  }

  void setTimerMinutes(int minutes) {
    _timer?.cancel();
    _remainingSeconds = minutes * 60;
    _isRunning = false;
    notifyListeners();
  }

  void setTimerSeconds(int seconds) {
    _timer?.cancel();
    _remainingSeconds = seconds;
    _isRunning = false;
    notifyListeners();
  }

  Future<void> _playAlarm() async {
    try {
      // If using an asset:
      await _audioPlayer.play(AssetSource('sounds/lofi-alarm.mp3'),);

      // If your file is in 'assets/sounds/alarm.mp3'
      // Make sure 'alarm.mp3' is declared in pubspec.yaml
    } catch (e) {
      // Handle error if any
      debugPrint('Error playing sound: $e');
    }
  }
}
