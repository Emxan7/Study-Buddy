import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What does HTML stand for?',
      'options': [
        'HyperText Markup Language',
        'Home Tool Markup Language',
        'Hyperlinks and Text Markup Language'
      ],
      'answer': 'HyperText Markup Language'
    },
    {
      'question': 'What is CSS used for?',
      'options': ['Creating webpages', 'Styling webpages', 'Data storage'],
      'answer': 'Styling webpages'
    },
    {
      'question': 'Which tag is used to create a hyperlink in HTML?',
      'options': ['<a>', '<link>', '<href>'],
      'answer': '<a>'
    },
    {
      'question': 'What does PHP stand for?',
      'options': [
        'Hypertext Preprocessor',
        'Pretext Hypertext Processor',
        'Personal Home Page'
      ],
      'answer': 'Hypertext Preprocessor'
    },
    {
      'question': 'Which of the following is a JavaScript framework?',
      'options': ['React', 'Laravel', 'Django'],
      'answer': 'React'
    },
    {
      'question': 'What is Dart mainly used for?',
      'options': [
        'Game development',
        'Web development',
        'Mobile app development'
      ],
      'answer': 'Mobile app development'
    },
    {
      'question': 'Which company developed Flutter?',
      'options': ['Facebook', 'Google', 'Microsoft'],
      'answer': 'Google'
    },
  ];

  int currentQuestion = 0;
  int score = 0;
  bool showResult = false;

  void _checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestion]['answer']) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFd08af6)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Quiz', style: TextStyle(color: Color(0xFFd08af6))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: showResult
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFFd08af6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your score: $score/${questions.length}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFd08af6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    _buildNeonButton(context, 'Restart Quiz', _resetQuiz),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      questions[currentQuestion]['question'],
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFd08af6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ...questions[currentQuestion]['options'].map((option) {
                      return GestureDetector(
                        onTap: () => _checkAnswer(option),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border:
                                Border.all(color: Color(0xFF00f0ff), width: 2),
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
                            option,
                            style: TextStyle(
                              color: Color(0xFFd08af6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildNeonButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
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
}
