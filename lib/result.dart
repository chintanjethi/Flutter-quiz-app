import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it';
    if (resultScore <= 25) {
      resultText = 'You are amazing and innocent';
    } else if (resultScore <= 35) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 45) {
      resultText = 'You are strange...';
    } else {
      resultText = 'You are psycho.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text('Restrart Quiz'),
            textColor: Colors.cyan,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
