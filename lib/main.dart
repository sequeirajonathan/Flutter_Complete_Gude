//Packages
import 'package:flutter/material.dart';

//Widgets
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _title = 'My First App';
  var _questionIndex = 0;
  var questions = [
    {'questionText': 'What\'s your favorite color?', 'answers':['black', 'Red', 'Green', 'White'],},
    {'questionText': 'What\'s your favorite animal?', 'answers':['Rabbit', 'Snake', 'Elephant', 'Lion'],},
    {'questionText': 'Who is your favorite instructor?', 'answers':['Max','Max','Max','Max'],},
];

  void _answerQuestion() {
    if (_questionIndex >= questions.length - 1) {
      setState(() {
        _questionIndex = 0;
      });
    } else {
      setState(() {
        _questionIndex += 1;
      });
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(_title),
          ),
          body: Column(children: [
            Question(questions[_questionIndex]['questionText']),
            //... operator extracts each list indivudually instead of creating nested lists
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
            }).toList(),
          ])),
    );
  }
}
