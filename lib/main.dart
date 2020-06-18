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


  final _images = const [
   'https://i.ytimg.com/vi/u-CuWAy7ud4/maxresdefault.jpg',
   'https://images.squarespace-cdn.com/content/51b3dc8ee4b051b96ceb10de/1587998867092-QZUUHUO3YH5DQL9ZS87W/james-gunn-applauds-a-fans-guardians-of-the-galaxy-theory-that-meredith-quill-might-be-an-avatar-on-an-otherworldly-entity-social.jpg?format=1500w&content-type=image%2Fjpeg',
   'https://miro.medium.com/max/3840/1*1YUR0pyV-WSKH9KrsCstCA.jpeg',
   'https://cdn.shopify.com/s/files/1/1822/8977/products/TB24HXlhFXXXXbNXpXXXXXXXXXX__251056596_800x.jpg?v=1509378731',
   'https://nerdist.com/wp-content/uploads/2018/03/Dancing-Groot-6-1024x716.jpg',
   'https://4.bp.blogspot.com/-9wUewlHRG6g/VUa3Rw2owkI/AAAAAAAAB7Y/TwSoJgw4pCc/s1600/Scarlett-Johansson-Iron-Man-2-Production-Still-HQ-scarlett-johansson-11258287-1620-1054.jpg',
   'https://i.insider.com/52cd6e666bb3f7422a5aed68?width=1200&format=jpeg',
   'https://media.comicbook.com/2019/08/howard-stark-dominic-cooper-marvel-s-agent-carter-mcu-1181854-1280x0.jpeg',
   'https://preview.redd.it/gv6ethzdal811.png?width=594&format=png&auto=webp&s=0254144fd8fb1176bd4458554291d1dce2c5887d',
   'https://images-na.ssl-images-amazon.com/images/I/71NsFbAYulL._AC_SY879_.jpg',
      ];



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
                images: _images,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
