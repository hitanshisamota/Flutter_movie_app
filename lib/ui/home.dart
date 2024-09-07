import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "It was on 15th August 1947 that India was declared independent from British colonialism.",
        true),
    Question.name(
        "Indian constitution took the concept of single citizenship from USA.",
        false),
    Question.name(
        "In India, everyone who is eighteen or above eighteen enjoys the right to vote.",
        true),
    Question.name(
        " Motilal Nehru Committee in 1928 came in favour of the concept of jus soli for the first time. ",
        true),
    Question.name(
        "Citizenship is listed in the State List under the Constitution of India. ",
        false),
    Question.name(
        "The Citizenship (Amendment) Act, 2019 was passed by the Parliament of India on 11 December 2019. ",
        true),
    Question.name(
        "The Advocate General is appointed by the Chief Minister of the respective state",
        false),
    Question.name(
        "To become the Chief Minister one must be 25 years of age or more. ",
        true),
    Question.name("Republic Day is celebrated on 29th of every January", false),
    Question.name(
        "A person born in India on or after 26th January 1950 but before 1st July, 1987 is citizen of India by birth irrespective of the nationality of his parents.",
        true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,

      // we use builder here to use a context that is a descendant of scaffold
      // or else scaffold.of will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Image.asset(
                    "images/hello.png",
                    width: 200,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 140.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 16.9,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),

                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )

                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(microseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackbar);

      //correct answer
      debugPrint("Yes Correct!");

      _updateQuestion();
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(microseconds: 1000),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);

      //Incorrect answer
      debugPrint("Incorrect!");

      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
