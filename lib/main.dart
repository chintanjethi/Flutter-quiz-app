import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Cyan', 'score': 5},
        {'text': 'Yellow', 'score': 15},
        {'text': 'Red', 'score': 20},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 20},
        {'text': 'Elephant', 'score': 15},
        {'text': 'Lion', 'score': 5},
      ],
    },
    {
      'questionText': 'Who is your favourite instructor',
      'answers': [
        {'text': 'Rakesh Biswas', 'score': 10},
        {'text': 'Rusha patra', 'score': 20},
        {'text': 'Sumit sir', 'score': 5},
        {'text': 'Dipendu sir', 'score': 15},
      ],
    },     
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
// RaisedButton 
              //   child: Text('Answer 1'),
              //   onPressed: _answerQuestion,
              // ),
              // RaisedButton(
              //   child: Text('Answer 2'),
              //   onPressed: () => print('Answer 2 chosen!'),
              // ),
              // RaisedButton(
              //   child: Text('Answer 3'),
              //   onPressed: () {
              //     // . . .
              //     print('Answer 3 chosen');
              //   },
              // ),