import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  //   // 'The capital of India is New Delhi.',
  //   // 'The Great Wall of China is visible from space.',
  //   // 'Light travels faster than sound.',
  //   // 'Shakespeare wrote "Hamlet".',
  //   // 'The Pacific Ocean is the smallest ocean.',
  //   // 'Jupiter is the largest planet in our solar system.',
  //   // 'The chemical symbol for gold is Ag.',
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true /*, true, false, true, true, false, true, false*/,
  // ];

  int TotalcorrectAnswers = 0;

  List<Question> questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('The Earth is the third planet from the Sun.', true),
    Question('The Moon is Earth\'s only natural satellite.', true),
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text('True', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  TotalcorrectAnswers++;
                  print("you got it right");
                } else {
                  print("you got it wrong");
                }
                setState(() {
                  scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  questionNumber++;
                });
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('False', style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  TotalcorrectAnswers++;
                  print("you got it right");
                } else {
                  print("you got it wrong");
                }
                setState(() {
                  scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  questionNumber++;
                });
              },
            ),
          ),
        ),

        Row(children: scoreKeeper),
      ],
    );
  }
}
