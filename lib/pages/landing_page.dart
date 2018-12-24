import 'package:flutter/material.dart';
import './quiz_page.dart';

/** Stateless widget
 * a widget with no direct state management. it only renders the value/data from the state
 */
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // paper widget used to build UI's
    return new Material(
      color: Colors.greenAccent,
      // button widget
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Let's Quizzz",
              style: new TextStyle(
                fontSize: 48.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Text(
              "Tap to start!",
              style: new TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            new Text(""),
          ],
        ),
      ),
    );
  }
}
