import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int _remainingTime = 60;
  int  _initialTime = 60;
  Timer? _timer;
  bool _isRunning = false;

  int get remainingTime => _remainingTime;
  int get initialTime => _initialTime;
  bool get isRunning => _isRunning;

  void StartTime() {
    if(_timer != null || _remainingTime == 0) return;
    _isRunning = true;
    _timer = Timer.periodic(
      Duration(seconds: 1),
        (timer) {
        if (_remainingTime > 0){
          _remainingTime--;
          notifyListeners();
        }
        else{
          _timer?.cancel();
          _timer = null;
          _remainingTime = _initialTime;
          _isRunning = false;
          notifyListeners();
        }
      }
    );
  }
  void pauseTime(){
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    notifyListeners();
  }
  void resetTime(){
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _remainingTime = _initialTime;
    notifyListeners();
  }
  void setTime (int seconds ) {
    _remainingTime = seconds;
    _initialTime = seconds;
    notifyListeners();
  }
}