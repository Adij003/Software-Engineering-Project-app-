import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({super.key});

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  Timer? _timer;
  int _timeInSeconds = 1500; // 25 minutes
  bool _isRunning = false;
  bool _isInBreak = false;
  final int _breakDurationInSeconds = 300; // 5 minutes

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeInSeconds > 0) {
          _timeInSeconds--;
        } else if (_isInBreak) {
          _timer?.cancel();
          _isRunning = false;
        } else {
          _timeInSeconds = _breakDurationInSeconds;
          _isInBreak = true;
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _timeInSeconds = 1500; // 25 minutes
      _isInBreak = false;
    });
  }

  String get _timerText {
    Duration duration = Duration(seconds: _isInBreak ? _breakDurationInSeconds : _timeInSeconds);
    return "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}";
  }

  String get _timerLabel {
    return _isInBreak ? "Break" : "Study";
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Pomodoro Timer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _timerLabel,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 16),
              Text(
                _timerText,
                style: const TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isRunning ? null : _startTimer,
                    child: const Text("Start"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _isRunning ? _stopTimer : null,
                    child: const Text("Stop"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    child: const Text("Reset"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
