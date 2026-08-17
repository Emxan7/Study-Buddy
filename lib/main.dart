import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(StudyBuddyApp());
}

class StudyBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Study Buddy',
      home: HomeScreen(),
    );
  }
}

