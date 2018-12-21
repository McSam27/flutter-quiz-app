import 'package:flutter/material.dart';

// page imports
import '../utils/question.dart';
import '../utils/quiz.dart';

// ui widget imports
import '../ui/answer_button.dart';
import '../ui/question_label.dart';
import '../ui/answer_overlay.dart';

// stateful widget that can be rebuilt with new data
// can be used for feedback, animation, changing data,

// no variables within the StatefulWidget, immutable
class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new QuizPageState();
  }
}

// variables and logic goes in the extending class
// mutable
class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    // Stack - places children on top of each other
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // main page
          children: <Widget>[
            // true button
            new AnswerButton(true, () => print('true')),
            // question label
            new QuestionText("Pizza is awesome", 2),
            // false button
            new AnswerButton(false, () => print('false')),
          ],
        ),
        new AnswerOverlay(false),
      ],
    );
  }
}
