import './question.dart';

class Quiz {
  // to make a private variable, we prefix the variable with an "_"
  List<Question> _questions;
  int _currentQuestionIndex = -1; // set default
  int _score = 0;

  Quiz(this._questions) {
    _questions.shuffle(); // randomize the questions
  }

  // getter in Dart arrow syntax
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get score => _score;
  int get questionNumber => _currentQuestionIndex + 1;
  // getter in Dart function syntax
  Question get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) return null;
    return _questions[_currentQuestionIndex];
  }

  // Function to handle users answers a question
  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}

// This is how you use the getter in an object instance.
// Quiz quiz = new Quiz([new Question("question", true)]);
// quiz.score;
