import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'start.dart';
import 'quiz.dart';
import 'results.dart';

QuizBrain quizBrain = new QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/quiz': (context) => QuizzlerApp(),
        '/result': (context) => Results(),
      },
    );
  }
}

//class QuizzlerApp extends StatefulWidget {
//  @override
//  _QuizzlerAppState createState() => _QuizzlerAppState();
//}
//
//class _QuizzlerAppState extends State<QuizzlerApp> {
//  List<Icon> scoreKeeper = [];
//
//  void checkAnswer(bool userAnswer) {
//    if (userAnswer == quizBrain.getAnswer()) {
//      setState(() {
//        scoreKeeper.add(
//          Icon(
//            Icons.check,
//            color: Colors.green,
//          ),
//        );
//        quizBrain.nextQuestion();
//      });
//    } else {
//      setState(() {
//        scoreKeeper.add(
//          Icon(
//            Icons.close,
//            color: Colors.red,
//          ),
//        );
//        quizBrain.nextQuestion();
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Expanded(
//          flex: 6,
//          child: Center(
//            child: Padding(
//              padding: const EdgeInsets.all(20.0),
//              child: Text(
//                quizBrain.getQuestion(),
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//        ),
//        Expanded(
//          flex: 2,
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                FlatButton(
//                  color: Colors.green,
//                  textColor: Colors.white,
//                  disabledColor: Colors.grey,
//                  disabledTextColor: Colors.black,
//                  padding: EdgeInsets.all(20.0),
//                  splashColor: Colors.white,
//                  onPressed: () {
//                    checkAnswer(true);
//                  },
//                  child: Text(
//                    "True",
//                    style: TextStyle(fontSize: 20.0),
//                  ),
//                ),
//                FlatButton(
//                  color: Colors.red,
//                  textColor: Colors.white,
//                  disabledColor: Colors.grey,
//                  disabledTextColor: Colors.black,
//                  padding: EdgeInsets.all(20.0),
//                  splashColor: Colors.white,
//                  onPressed: () {
//                    checkAnswer(false);
//                  },
//                  child: Text(
//                    "False",
//                    style: TextStyle(fontSize: 20.0),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//        Expanded(
//          flex: 1,
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Row(
//              children: scoreKeeper,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}
