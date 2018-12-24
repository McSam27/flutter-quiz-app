import 'package:flutter/material.dart';

// page imports
import '../utils/question.dart';
import '../utils/quiz.dart';

// ui widget imports
import '../ui/answer_button.dart';
import '../ui/question_label.dart';
import '../ui/answer_overlay.dart';

import '../pages/score_page.dart';

// stateful widget that can be rebuilt with new data
// can be used for feedback, animation, changing data,

// no variables within the StatefulWidget, immutable
class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QuizPageState();
  }
}

// variables and logic goes in the extending class
// mutable
class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz(
    [
      new Question("Is Elon Musk human?", true),
      new Question("Is pizza healthy?", false),
      new Question("Is Flutter awesome?", true),
      new Question("Is the sky blue?", true),
      new Question("Is the grass green?", true),
      new Question("Does 2 plus 2 equal 4?", true),
      new Question("Is Fortnite an awesome game?", true),
    ],
  );
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool showOverlay = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      showOverlay = true;
    });
  }

  void handleNextQuestion() {
    // NOTE: When accessing a class getter function, you do not need to run the function
    // you can simply access it like a property of the class
    if (quiz.length == questionNumber) {
      // remove all previous pages from navigation stack
      Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              new ScorePage(quiz.score, quiz.length),
        ),
        (Route route) => route == null,
      );
      return;
    }
    currentQuestion = quiz.nextQuestion;
    this.setState(() {
      showOverlay = false;
      questionText = currentQuestion.question;
      questionNumber = quiz.questionNumber;
    });
  }

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
            new AnswerButton(true, () => handleAnswer(true)),
            // question label
            new QuestionText(questionText, questionNumber),
            // false button
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        showOverlay
            ? new AnswerOverlay(isCorrect, handleNextQuestion)
            : new Container(), // empty container doesn't display anything
      ],
    );
  }
}
