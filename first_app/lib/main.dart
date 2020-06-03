import 'package:first_app/results.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './results.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questions = [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Blue', 'White', 'Yellow']
    },
    {
      'questionText': 'What is your favorite shark?',
      'answers': [
        'Great white shark',
        'whale shark',
        'bull shark',
        'hammerhead shark'
      ]
    },
    {
      'questionText': 'What is the best place to vacation?',
      'answers': ['Hawaii', 'Cozumel Mexico', 'Phoenix Arizona']
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'White', 'score': 8},
          {'text': 'Blue', 'score': 6},
          {'text': 'Red', 'score': 4},
        ]
      },
      {
        'questionText': 'What is your favorite shark?',
        'answers': [
          {'text': 'Great white shark', 'score': 10},
          {'text': 'whale shark', 'score': 8},
          {'text': 'bull shark', 'score': 6},
          {'text': 'hammerhead shark', 'score': 4},
        ]
      },
      {
        'questionText': 'What is the best place to vacation?',
        'answers': [
          {'text': 'Cozumel Mexico', 'score': 10},
          {'text': 'Phoenix Arizona', 'score': 8},
          {'text': 'Hawaii', 'score': 6},
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestions: _answerQuestion,
                questionIndex: _questionIndex,
                questions: questions,
              )
            : Result(_totalScore, _restQuiz),
      ),
    );
  }
}
