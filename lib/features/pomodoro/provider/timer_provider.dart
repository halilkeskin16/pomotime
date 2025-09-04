import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider  extends ChangeNotifier {
  Timer? timer;
  int _remainingSeconds = 1500;
  final int _totalDuration = 1500;
  bool _isRunning = false;

  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _isRunning;
  double get progress => (_remainingSeconds / _totalDuration);
  String get timeDisplay {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startTimer() {
    _isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        pauseTimer();
      }
    });
  }

  void pauseTimer() {
    timer?.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    timer?.cancel();
    _remainingSeconds = _totalDuration;
    _isRunning = false;
    notifyListeners();
  }
}