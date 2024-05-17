import 'package:flutter/material.dart';
import 'package:frontend/views/lesson/lesson-question.dart';

import '../../repository/question.dart';
import '../home/component/status_bar.dart';

class LessonTheory extends StatefulWidget {
  final String title;

  const LessonTheory({super.key, required this.title});

  @override
  State<LessonTheory> createState() => _LessonTheory();
}

class _LessonTheory extends State<LessonTheory> {
  List<Question> list_quesiton = [];  // lưu list câu hỏi
  String textButton = 'Done it?';
  IconData iconButton = Icons.touch_app; // icon mặc định khi chưa hoàn thành
  Color themesColor = Colors.pinkAccent;  // color themes
  List<int> statusQuestion = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int count = 0;          // câu hiện tại
  List<String> list_header = []; // header

  @override
  void initState() {
    super.initState();
    list_quesiton = [
      Question(
          question:
              "Learn about Java's history, key features, and its write once, run anywhere "
              "capability, making it versatile for various applications.",
          image: 'assets/images/java_1.jpg'),
      Question(
          question: "Step-by-step instructions for downloading and installing JDK,"
            "setting up environment variables, and configuring an IDE like IntelliJ IDEA or Eclipse.",
          image: 'assets/images/java_2.jpg'),
      Question(question: "Understand the structure of a Java program, including the main method, class declarations, "
            "and basic syntax elements like semicolons and braces.",
          image: 'assets/images/java_3.jpg'),
      Question(
            question: "Learn about Java's primitive data types (int, double, char, boolean), reference types, "
            "how to declare and initialize variables, and type conversion.",
          image: 'assets/images/java_4.jpg'),
      Question(
          question: "Explore the different operators in Java, including arithmetic, relational, "
            "logical, bitwise, and assignment operators, with practical examples.",
          image: 'assets/images/java_5.png'),
      Question(
          question: "Master the use of control flow statements such as if-else, switch, while loop, for loop, "
            "and enhanced for loop, with practical coding examples.",
          image: 'assets/images/java_6.jpg'),
      Question(
          question: "Dive into OOP principles: classes, objects, inheritance, polymorphism, "
              "encapsulation, and abstraction, with illustrative examples.",
          image: 'assets/images/java_7.jpg'),
      Question(
          question: "Learn to handle exceptions using try-catch blocks, multiple catch clauses, the finally block, "
            "the throw keyword, and creating custom exceptions.",
          image: 'assets/images/java_8.png'),
      Question(
          question: "Get acquainted with the Java Collections Framework, including interfaces like List, Set, Map, and classes "
            "like ArrayList, HashSet, and HashMap, for managing groups of objects.",
          image: 'assets/images/java_9.jpg'),
      // Question(
      //     question: "Can you kick girl friend",
      //     image: 'assets/images/coin.png'),
    ];

    list_header = [
      'Introduction to Java',
      'Setting up Java Environment',
      'Basic Syntax',
      'Data Types and Variables',
      'Operators in Java',
      'Control Flow Statements',
      'Object-Oriented Programming',
      'Exception Handling',
      'Java Collections Framework'
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getIcon(0),
              getIcon(1),
              getIcon(2),
              getIcon(3),
              getIcon(4),
              getIcon(5),
              getIcon(6),
              getIcon(7),
              getIcon(8),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
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
                        color: themesColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Step ' '${count + 1}' ': ${list_header[count]}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      list_quesiton[count].question,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image.asset("${list_quesiton[count].image}", height: 150)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: 200,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    textButton = 'Good job!';
                    themesColor = Colors.greenAccent;
                    iconButton = Icons.check;
                    statusQuestion[count] = 1;
                  });
                  setState(() {
                    if(textButton == 'Good job!') {
                      count++;
                      checkStatus();
                    }
                  });
                // onPressed: () {
                //     setState(() {
                //       textButton = 'Good job!';
                //       themesColor = Colors.greenAccent;
                //       iconButton = Icons.check;
                //       count++;
                //       checkStatus();
                //     });
                },
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double>(5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(themesColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textButton,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                    Icon(
                      iconButton,
                      color: Colors.white,
                      size: 35,
                    )
                  ],
                )),
          ),
          const Spacer(),
          barNextQuestion(),
        ],
      ),
    );
  }

  Widget barNextQuestion() {
    return !(statusQuestion[8] == 1)
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                border: Border.all(
                  color: themesColor,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.0,
                    blurRadius: 2.0,
                    offset: const Offset(0.0, 5.0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.blue,
                      size: 35,
                    ),
                    onPressed: () {
                      setState(() {
                        count--;
                        checkStatus();
                      });
                    },
                  ),
                  Text(
                    '${count + 1} / 9',
                    style: const TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                          checkStatus();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.blue,
                        size: 35,
                      )),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 30),
            child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double>(5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonQuestion(title: widget.title),
                    ),
                  );
                },
                child: const Text(
                  'Review question',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22),
                )),
          );
  }

  void checkStatus() {
    if (statusQuestion[count] == 0) {
      textButton = 'Done it?';
      iconButton = Icons.touch_app;
      themesColor = Colors.pinkAccent;
    } else {
      textButton = 'Good job!';
      themesColor = Colors.greenAccent;
      iconButton = Icons.check;
    }
  }

  Widget getIcon(int _count) {
    if ((statusQuestion[_count] == 1)) {
      return IconButton(
        icon: const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 35,
        ),
        onPressed: () {
          setState(() {
            count = _count;
            checkStatus();
          });
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.cancel_outlined, color: Colors.grey, size: 35),
        onPressed: () {
          setState(() {
            count = _count;
            checkStatus();
          });
        },
      );
    }
  }
}
