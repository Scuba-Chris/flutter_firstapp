import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultsScore;
  final Function restHandler;

  Result(this.resultsScore, this.restHandler);

  String get resultPhrase {
    String resultText;
    if (resultsScore <= 16) {
      resultText = 'you are lame';
    } else if (resultsScore <= 22) {
      resultText = 'you are alright';
    } else {
      resultText = 'you are AWESOME!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(onPressed: restHandler, child: Text('Restart Quiz!'))
      ],
    ));
  }
}
