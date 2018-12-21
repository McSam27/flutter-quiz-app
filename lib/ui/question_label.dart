import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {

  // widget variables
  final String _question;
  final int _questionNumber;

  // constructor
  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          // NOTE: Use keyword, 'widget' to access the class variables in the Widget class
          child: new Text("Statement " + widget._questionNumber.toString() + ": " + widget._question),
        ),
      ),
    );
  }
}
