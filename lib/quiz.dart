import "package:flutter/material.dart";
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = new QuizBrain();

class QuizzlerApp extends StatefulWidget {
  @override
  _QuizzlerAppState createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    if (userAnswer == quizBrain.getAnswer()) {
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        quizBrain.increaseScore();
        bool isFinished = quizBrain.nextQuestion();
        if (isFinished) {
          showAlert();
        }
      });
    } else {
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        bool isFinished = quizBrain.nextQuestion();
        if (isFinished) {
          showAlert();
        }
      });
    }
  }

  void resetQuiz() {
    Navigator.pop(context);
    quizBrain.resetQuiz();
    setState(() {
      scoreKeeper = [];
    });
  }

  void backToHome() {
    resetQuiz();
    Navigator.pushNamed(context, '/');
  }

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Good Job!",
      desc: quizBrain.getResults(),
      buttons: [
        DialogButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'modak',
              ),
            ),
          ),
          onPressed: resetQuiz,
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Back to Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'modak',
              ),
            ),
          ),
          onPressed: backToHome,
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Question 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontFamily: 'modak',
                      ),
                    ),
                    Text(
                      quizBrain.getQuestion(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(16.0),
                    splashColor: Colors.white,
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontFamily: 'modak',
                      ),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(16.0),
                    splashColor: Colors.white,
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontFamily: 'modak',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
