import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // variables
  // stateless widgets should have final in front of the internal widget variables
  // these variables can also be private; prefixed with an "_"
  final bool _answer;

  // VoidCallback is a signature for a function
  // this allows to send in a function that returns a specific type
  // does not have any parameters
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              child: new Text(_answer == true ? "True" : "False"),
            ),
          ),
        ),
      ),
    );
  }
}
