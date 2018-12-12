import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: Colors.greenAccent,
        child: new InkWell(
          onTap: () => print('answered true'),
          child: new Center(
            child: new Container(child: new Text("True")),
          ),
        ),
      ),
    );
  }
}
