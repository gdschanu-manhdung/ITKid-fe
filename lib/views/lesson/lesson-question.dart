import 'package:flutter/material.dart';
import 'package:frontend/views/lesson/lesson-result.dart';

import '../../repository/question.dart';
import '../home/component/status_bar.dart';

class LessonQuestion extends StatefulWidget {
  final String title;

  const LessonQuestion({super.key, required this.title});

  @override
  State<LessonQuestion> createState() => _LessonQuestion();
}

class _LessonQuestion extends State<LessonQuestion> {
  List<Question> list_question = [];
  List<Color> colorButton = [Colors.blue, Colors.pink, Colors.orange, Colors.green];
  List<Color> colorIcon = [Colors.blue, Colors.pink, Colors.orange, Colors.green];
  List<Color> colorText = [Colors.white, Colors.white, Colors.white, Colors.white];
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    list_question.addAll([
      Question(
        question: "What is the extension part of Java files?",
        option: [".java", ".py", ".class", ".js"],
        correctAnswer: 0,
      ),
      Question(
        question: "Which method is used to start a thread in Java?",
        option: ["run()", "start()", "init()", "begin()"],
        correctAnswer: 1,
      ),
      Question(
        question: "Which keyword is used to inherit a class in Java?",
        option: ["implements", "extends", "inherits", "super"],
        correctAnswer: 1,
      ),
      Question(
        question: "Which of the following is not a Java keyword?",
        option: ["class", "interface", "extends", "implement"],
        correctAnswer: 3,
      ),
      Question(
        question: "Which operator is used to compare two values in Java?",
        option: ["=", "==", "!=", "equals"],
        correctAnswer: 1,
      ),
      Question(
        question: "Which of these classes is part of Java's collection framework?",
        option: ["ArrayList", "HashTable", "LinkedList", "All of the above"],
        correctAnswer: 3,
      ),
      Question(
        question: "Which of these packages contains the core classes of Java?",
        option: ["java.lang", "java.util", "java.io", "java.net"],
        correctAnswer: 0,
      ),
      Question(
        question: "What is the size of int in Java?",
        option: ["4 bytes", "2 bytes", "8 bytes", "1 byte"],
        correctAnswer: 0,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget>[
          NavigationBar1(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.0,
                    blurRadius: 7.0,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: double.infinity - 32,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'REVIEW QUESTION',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    list_question[currentQuestionIndex].question,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 1.7,
              children: [
                getButton(list_question[currentQuestionIndex], 0, colorButton[0], colorText[0], colorIcon[0]),
                getButton(list_question[currentQuestionIndex], 1, colorButton[1], colorText[1], colorIcon[1]),
                getButton(list_question[currentQuestionIndex], 2, colorButton[2], colorText[2], colorIcon[2]),
                getButton(list_question[currentQuestionIndex], 3, colorButton[3], colorText[3], colorIcon[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton(Question question, int _option, Color _colorButton, Color _colorText, Color _colorIcon) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            colorButton = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];
            colorIcon = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];
            colorButton[_option] = Colors.white;
            colorText[_option] = Colors.black;
            if (_option == question.correctAnswer) {
              colorIcon[_option] = Colors.green;
            } else {
              colorIcon[_option] = Colors.red;
            }
          });
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              if (currentQuestionIndex < list_question.length - 1) {
                currentQuestionIndex++;
                colorButton = [Colors.blue, Colors.pink, Colors.orange, Colors.green];
                colorIcon = [Colors.blue, Colors.pink, Colors.orange, Colors.green];
                colorText = [Colors.white, Colors.white, Colors.white, Colors.white];
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LessonResult(title: widget.title)),
                );
              }
            });
          });
        },
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
          elevation: MaterialStateProperty.all<double>(5),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(_colorButton),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question.option![_option],
              style: TextStyle(fontWeight: FontWeight.bold, color: _colorText),
            ),
            _option != question.correctAnswer
                ? Icon(Icons.dangerous_outlined, color: _colorIcon, size: 35)
                : Icon(Icons.check_outlined, color: _colorIcon, size: 30)
          ],
        ),
      ),
    );
  }
}
