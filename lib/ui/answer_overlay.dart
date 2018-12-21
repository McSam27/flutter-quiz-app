import 'package:flutter/material.dart';

class AnswerOverlay extends StatefulWidget {
  final bool _isCorrect;

  AnswerOverlay(this._isCorrect);

  AnswerOverlayState createState() => AnswerOverlayState();
}

class AnswerOverlayState extends State<AnswerOverlay> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
          onTap: () => print('you tapped the overlay'),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: new Icon(
                    widget._isCorrect == true ? Icons.done : Icons.close,
                    size: 80.0),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 20.0),
              ),
              new Text(
                widget._isCorrect == true ? "Correct!" : "Wrong!",
                style: new TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          )),
    );
  }
}
