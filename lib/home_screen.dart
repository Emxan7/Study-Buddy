import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'study_timer_screen.dart';
import 'quiz_screen.dart';
import 'daily_quote_screen.dart';
import 'neon_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/neon_animation.json',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to AI Study Buddy',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFFd08af6),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color(0xFF00f0ff),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            NeonButton(
              label: '📚 Study Timer',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudyTimerScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            NeonButton(
              label: '📝 Take a Quiz',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            NeonButton(
              label: '🌟 Daily Quotes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotesScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
