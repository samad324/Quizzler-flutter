import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                child: Text(
                  'Quizzler App',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'modak',
                    fontSize: 48.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.tealAccent[400],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    splashColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz');
                    },
                    child: Text(
                      "Start Quiz",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontFamily: 'modak',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
