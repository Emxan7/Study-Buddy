import 'package:flutter/material.dart';
import 'dart:async';
import 'neon_button.dart';

class StudyTimerScreen extends StatefulWidget {
  @override
  _StudyTimerScreenState createState() => _StudyTimerScreenState();
}

class _StudyTimerScreenState extends State<StudyTimerScreen> {
  int _secondsLeft = 1500;
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          _timer!.cancel();
          _isRunning = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Time's up! Take a break."),
          ));
        }
      });
    });
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _secondsLeft = 1500;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Study Timer', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_secondsLeft),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            _isRunning
                ? NeonButton(
                    label: 'Reset',
                    onTap: _resetTimer,
                  )
                : NeonButton(
                    label: 'Start',
                    onTap: _startTimer,
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
