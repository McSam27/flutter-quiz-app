import 'package:flutter/material.dart';

// page imports
import '../utils/question.dart';
import '../utils/quiz.dart';

// ui widget imports
import '../ui/answer_button.dart';

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
      children: <Widget>[
        new Column(
          // main page
          children: <Widget>[
            // true button
            new AnswerButton(true, () => print('true')),
            // false button
            new AnswerButton(false, () => print('false')),
          ],
        )
      ],
    );
  }
}
