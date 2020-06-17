import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(
    this.resultScore,
    this.resetHandler,
  );

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 20) {
      resultText = 'You have no right to call yourself a Marvel fan.';
    } else if (resultScore > 20 && resultScore <= 50) {
      resultText =
          'With a little bit of improvement you can become a Marvelian.';
    } else if (resultScore > 50 && resultScore<=90) {
      resultText = 'You can call yourself a marvel fan.';
    }
    else if (resultScore > 90 ) {
      resultText = 'You can call yourself a true marvel fan.';
    }
    return resultText;
  }

  String get showScore {
    var showFinalScore = resultScore.toString();
    return showFinalScore;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Text(
            'Your final score is',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          Text(
            showScore,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
           Text(
            'Out of : 100',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text(
              'Restart Quiz!',
              style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
