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

class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  // SingleTicker... helps with animation
  // configured to only tick while the current tree is enabled

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  // init state method
  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 500),
        vsync: this // takes in widget (with the SingleTickerProvider)
        );
    _fontSizeAnimation = new CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut,
    );
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  // dispose animations when questions are no longer shown
  // free the animation resources
  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  // handle when the widget gets updated with new text
  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          // NOTE: Use keyword, 'widget' to access the class variables in the Widget class
          child: new Text(
            "Statement " +
                widget._questionNumber.toString() +
                ": " +
                widget._question,
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 15), // increases from 15 * 0.01 to 15 * 1.00
          ),
        ),
      ),
    );
  }
}
