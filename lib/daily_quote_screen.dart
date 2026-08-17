import 'package:flutter/material.dart';
import 'dart:math';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String _quote = 'Press the button to get a motivational quote!';
  bool _isLoading = false;

  final List<Map<String, String>> _quotes = [
    {'text': 'The only way to achieve the impossible is to believe it is possible.', 'author': 'Charles Kingsleigh'},
    {'text': 'Start where you are. Use what you have. Do what you can.', 'author': 'Arthur Ashe'},
    {'text': 'The future belongs to those who believe in the beauty of their dreams.', 'author': 'Eleanor Roosevelt'},
    {'text': 'Do not wait to strike till the iron is hot; but make it hot by striking.', 'author': 'William Butler Yeats'},
    {'text': 'You are never too old to set another goal or to dream a new dream.', 'author': 'C.S. Lewis'},
    {'text': 'If you can dream it, you can do it.', 'author': 'Walt Disney'},
  ];

  void _fetchQuote() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      final random = Random();
      final randomQuote = _quotes[random.nextInt(_quotes.length)];
      setState(() {
        _quote = '"${randomQuote['text']}"\n- ${randomQuote['author']}';
        _isLoading = false;
      });
    });
  }

  Widget _buildNeonButton(BuildContext context, String label, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap != null ? onTap : () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Color(0xFF00f0ff), width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF00f0ff).withOpacity(0.6),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Color(0xFFd08af6),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Color(0xFFd08af6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Daily Motivation', style: TextStyle(color: Color(0xFFd08af6))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFd08af6)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _quote,
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFd08af6),
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Color(0xFF00f0ff),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _buildNeonButton(
                context,
                _isLoading ? 'Loading...' : 'New Quote',
                _isLoading ? null : _fetchQuote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
