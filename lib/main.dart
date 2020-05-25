//Packages
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

//Widgets
import './quiz.dart';

void main() => runApp(MyApp());

const _title = 'My First App';

const _questions = [
  {
    'questionText': 'What\'s your favorite color?',
    'answers': [
      {'text': 'Black', 'score': 10},
      {'text': 'Red', 'score': 5},
      {'text': 'Green', 'score': 3},
      {'text': 'White', 'score': 1}
    ],
  },
  {
    'questionText': 'What\'s your favorite animal?',
    'answers': [
      {'text': 'Rabbit', 'score': 3},
      {'text': 'Snake', 'score': 11},
      {'text': 'Elephant', 'score': 5},
      {'text': 'Lion', 'score': 9}
    ],
  },
  {
    'questionText': 'Who is your favorite instructor?',
    'answers': [
      {'text': 'Max', 'score': 1},
      {'text': 'Max', 'score': 1},
      {'text': 'Max', 'score': 1},
      {'text': 'Max', 'score': 1}
    ],
  },
];

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
