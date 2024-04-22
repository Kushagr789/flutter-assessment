import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerModel extends ChangeNotifier {
  int _secondsLeft = 30; // Initial countdown time in seconds
  Timer? _timer;

  TimerModel() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        notifyListeners(); // Notify listeners to update UI
      } else {
        _timer!.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }

  int get secondsLeft => _secondsLeft;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer to avoid memory leaks
    super.dispose();
  }
}