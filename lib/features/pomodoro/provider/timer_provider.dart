import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:pomotime/features/auth/provider/auth_provider.dart';
import 'package:pomotime/features/user/provider/user_provider.dart';


enum TimerState { initial, running, paused, finished }

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  final int _totalDuration = 60;
  int _remainingDuration = 60;
  AuthProvider? _authProvider;
  UserProvider? _userProvider;
  
  TimerState _timerState = TimerState.initial;
  
  final int _lastEarnedCoins = 0;


  int get remainingDuration => _remainingDuration;
  TimerState get timerState => _timerState;
  bool get isRunning => _timerState == TimerState.running;
  int get lastEarnedCoins => _lastEarnedCoins;

  double get progress {
    if (_totalDuration == 0) return 1;
    return _remainingDuration / _totalDuration;
  }

  String get timeDisplay {
    final minutes = (_remainingDuration / 60).floor().toString().padLeft(2, '0');
    final seconds = (_remainingDuration % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void updateProviders(AuthProvider authProvider, UserProvider userProvider) {
    _authProvider = authProvider;
    _userProvider = userProvider;
  }

  void startTimer() {
    if (_timerState == TimerState.paused) {
      _timerState = TimerState.running;
    } else {
      _remainingDuration = _totalDuration;
      _timerState = TimerState.running;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingDuration > 0) {
        _remainingDuration--;
      } else {
        _timer?.cancel();
        _timerState = TimerState.finished;
        _calculateCoins();
      }
      notifyListeners();
    });
    notifyListeners();
  }

  void pauseTimer() {
    _timer?.cancel();
    _timerState = TimerState.paused;
    notifyListeners();
  }
  
  void resetTimer() {
    _timer?.cancel();
    _remainingDuration = _totalDuration;
    _timerState = TimerState.initial;
    notifyListeners();
  }

  void _calculateCoins() {
    if (_authProvider?.isLoggedIn ?? false) {
      int calculatedCoins = (_totalDuration / 60).floor();
      if (calculatedCoins == 0 && _totalDuration > 0) {
        calculatedCoins = 1;
      }
      _userProvider?.addCoins(calculatedCoins);
    }
  }
}
