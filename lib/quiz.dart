import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './images.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final List<Object> images;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex,
      @required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ShowImage(images[questionIndex]),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
