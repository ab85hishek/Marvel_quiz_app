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
  final _questions = const [
    {
      'questionText': 'Who developed the super soldier serum in Captain America?',
      'answers': [
      {'text':'DR. JOHANN SCHMIDT', 'score': 0 }, 
      {'text':'DR. ELI WIESEL', 'score':0}, 
      {'text':'DR. ARNIM ZOLA', 'score':0}, 
      {'text':'DR. ABRAHAM ERSKINE', 'score': 10},
      ],
    },
    {
      'questionText': 'Name Star-Lord\'s mother.',
      'answers': [
      {'text':'STAR-QUEEN', 'score':0}, 
      {'text':'JANE QUILL', 'score':0}, 
      {'text':'MEREDITH QUILL', 'score':10},
      {'text':'JOAN QUILL', 'score':0},
      ],
    },
    {
      'questionText': 'Who voices Jarvis, Iron Man\'s artificially intelligent assistant?',
      'answers': [
        {'text':'SIMON PEGG', 'score':0}, 
        {'text':'EWAN MCGREGOR', 'score':0}, 
        {'text':'PAUL BETTANY', 'score':10},
        {'text':'EDDIE REDMAYNE', 'score':0},
        ],
    },
     {
      'questionText': 'Forged in the heart of a dying star, what is Thor\'s hammer\'s name?',
      'answers': [
      {'text':'MJOLNIR', 'score':10}, 
      {'text':'THUNDER BRINGER', 'score':0}, 
      {'text':'FJORDIR', 'score':0},
      {'text':'ANDURIL', 'score':0},
      ],
    },
     {
      'questionText': 'What song does baby Groot dance to at the end of \'Guardians of the Galaxy\'?',
      'answers': [
       {'text':'\"WANNA BE STARTIN\' SOMETHIN\'\,\" MICHAEL JACKSON', 'score':0},
       {'text':'\"UPTIGHT\,\" STEVIE WONDER', 'score':0}, 
       {'text':'\"O-O-H CHILD\,\" FIVE STAIRSTEPS', 'score':0},
       {'text':'\"I WANT YOU BACK\,\" THE JACKSON 5', 'score':10},
       ],
    },
    {
      'questionText': 'What name did Black Widow use when first introduced to Tony Stark in Iron Man 2?',
      'answers': [
       {'text':'Natalia Romanoff', 'score':0},
       {'text':'Natalie Russell', 'score':0}, 
       {'text':'Natalia Roman', 'score':0},
       {'text':'Natalie Rushman', 'score':10},
       ],
    },
    {
      'questionText': 'In how many Marvel Studios films does Agent Coulson appear?',
      'answers': [
       {'text':'4', 'score':0},
       {'text':'6', 'score':0}, 
       {'text':'2', 'score':0},
       {'text':'5', 'score':10},
       ],
    },
    {
      'questionText': 'When did Howard Stark die?',
      'answers': [
       {'text':'December 16, 1991', 'score':10},
       {'text':'January 12, 1991', 'score':0}, 
       {'text':'March 31, 1991', 'score':0},
       {'text':'May 3, 1991', 'score':0},
       ],
    },
    {
      'questionText': 'Who is Thanos’s father?',
      'answers': [
       {'text':'Ziran the Tester', 'score':0},
       {'text':'Zuras', 'score':0}, 
       {'text':'A\’Lars', 'score':10},
       {'text':'Valkin', 'score':0},
       ],
    },
    {
      'questionText': 'True or False: The Infinity Gauntlet makes a cameo appearance in Thor?',
      'answers': [
       {'text':'True', 'score':10},
       {'text':'False', 'score':0}, 
       
       ],
    },

  ];
  var _totalScore =0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("more question are there");
    }
    else{
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text('Marvel quiz'),
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
