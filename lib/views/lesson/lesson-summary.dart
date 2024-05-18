import 'package:flutter/material.dart';
import 'package:frontend/views/lesson/lesson-result-summary.dart';

import '../../repository/question.dart';
import '../home/component/status_bar.dart';

class LessonSummary extends StatefulWidget {
  final String title;

  const LessonSummary({super.key, required this.title});

  @override
  State<LessonSummary> createState() => _LessonSummary();
}

class _LessonSummary extends State<LessonSummary> {
  List<Question> list_quesiton = [];
  int count = 0;
  int point = 0;
  double progress = 0;
  bool isChoose = false;
List <Color> listColorButton = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

  @override
  void initState() {
    super.initState();
    list_quesiton = [
      Question(
        question: "The extension part of Python files",
        option: [".py", ".c", ".java", ".python"],
        correctAnswer: 0,
      ),
      Question(
        question: "Which one is a primitive data type in Java?",
        option: ["Integer", "String", "Array", "Boolean"],
        correctAnswer: 0,
      ),
      Question(
        question: "What is the scope of a local variable in C++?",
        option: ["Global", "Local", "Static", "Dynamic"],
        correctAnswer: 1,
      ),
      Question(
        question: "Which command is used to take input from the user in Python?",
        option: ["read()", "input()", "get()", "scanf()"],
        correctAnswer: 1,
      ),
      Question(
        question: "What is the purpose of the System.out object in Java?",
        option: ["Input data", "Output data to the screen", "Handle exceptions", "Perform calculations"],
        correctAnswer: 1,
      ),
      Question(
        question: "The operator used to increment the value of an integer variable in C++ is",
        option: ["++", "+=", "--", "*="],
        correctAnswer: 0,
      ),
      Question(
        question: "Which syntax is used to create a while loop in Python?",
        option: ["while()", "for()", "loop()", "repeat()"],
        correctAnswer: 0,
      ),
      Question(
        question: "Which command is used to create a new object in Java?",
        option: ["create", "make", "new", "instance"],
        correctAnswer: 2,
      ),
      Question(
        question: "What is the correct syntax to declare a pointer in C++?",
        option: ["int ptr;", "*int ptr;", "int *ptr;", "ptr *int;"],
        correctAnswer: 2,
      ),
      Question(
        question: "Which command is used to reverse a string in Python?",
        option: ["reverse()", "invert()", "flip()", "[::-1]"],
        correctAnswer: 3,
      ),
    ];
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.run_circle_sharp,color: Colors.teal,size: 35,),
                Container(
                  width: 300,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: LinearProgressIndicator(
                      value: progress,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.tealAccent),
                      backgroundColor: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'REVIEW QUESTION ' '${count + 1}' '/10',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    list_quesiton[count].question,
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
                getButton(list_quesiton[count], 0),
                getButton(list_quesiton[count], 1),
                getButton(list_quesiton[count], 2),
                getButton(list_quesiton[count], 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton(Question question, int option) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
          onPressed: () {
            if(!isChoose) {
              isChoose = true;
              checkResult(question, option);
              resetStatus(option);

            }


          },
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
            elevation: MaterialStateProperty.all<double>(5),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(listColorButton[option]),
          ),
          child: Text(
            question.option![option],
            style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }
void checkResult(Question question, int choice) {
    setState(() {
      if(question.correctAnswer == choice) {
        listColorButton[choice] = Colors.green;
        point++;
      } else {
        listColorButton[choice] = Colors.red;
      }
    });


}
  void resetStatus(int option) {
    Future.delayed(const Duration(seconds: 2), () {
    setState(() {
      if(count<9) {

          listColorButton[option] =Colors.white;
          count++;
          progress = (count)/10;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LessonResultSummary(title: widget.title, point: point,)),
        );
      }
    });
    isChoose = false;
    });
  }
}
