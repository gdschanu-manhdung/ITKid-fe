import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:frontend/base.dart';
import 'package:frontend/game/component/ViewQuestion.dart';
import 'package:frontend/game/config.dart';
import 'package:frontend/game/entity/box_question.dart';

import '../repository/question.dart';
import '../views/home/component/status_bar.dart';
import 'entity/entity.dart';
import 'entity/none.dart';
import 'entity/player.dart';
import 'entity/treasure.dart';
import 'entity/wall.dart';

ValueNotifier<bool> viewQuestionNotifier = ValueNotifier<bool>(false);
ValueNotifier<bool> viewButton = ValueNotifier<bool>(false);
const double UNIT = GameUnit.UNIT;
late TextComponent textComponent;
late Player player;
bool isUp = false;
bool isDown = false;
bool isLeft = false;
bool isRight = false;
int isCorrect = 2;
bool isWin = false;
int status = 99;


late List<List<Entity>> map;

class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  List<Color> containerColor = [
    Colors.black45,
    Colors.black45,
    Colors.black45,
    Colors.black45
  ];
  int _time = 300;

  List<Question> list_quesiton = [
    Question(
      question: "What is the common file extension for Python scripts?",
      option: [".py", ".cpp", ".js", ".java"],
      correctAnswer: 0,
    ),
    Question(
      question: "In comments, how do you write a single line in Python?",
      option: [
        "// This is a comment",
        "# This is a comment",
        "; This is a comment",
        "* This is a comment"
      ],
      correctAnswer: 1,
    ),
    Question(
      question:
      "Which of these operators is used for printing output in Python?",
      option: ["print()", "echo()", "output()", "display()"],
      correctAnswer: 0,
    ),
    Question(
      question: " What is the keyword used to define a function in Python?",
      option: ["function", "define", "def", "create"],
      correctAnswer: 2,
    ),
    Question(
      question:
      "How do you indicate the end of a line of code in Python (assuming no semicolon is used)?",
      option: ["Semicolon (;) required", "Enter key", "Line break", "Commas"],
      correctAnswer: 1,
    ),
  ];
  int count = 0;
  late var game;

  @override
  void initState() {
    game = GameWidget(game: MyWorld());
    // TODO: implement initState
    super.initState();
    Stream<int> timerStream = Stream.periodic(const Duration(seconds: 1), (_) => 1);
    timerStream.listen((_) {
      setState(() {
        if (_time > 0) {
          _time--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget> [

          NavigationBar1(),
        ],
      ),
      body: Column(
        children: [

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Treasure Game',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.orange),
            ),
          ),
          Stack(children: [
            SizedBox(
              width: double.infinity,
              height: 420,
              child: game,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ValueListenableBuilder<bool>(
                  valueListenable: viewButton,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: value,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                          // Set rounded corners
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54, // Set shadow color
                              blurRadius: 10.0, // Set blur radius
                              offset: Offset(0.0, 10.0), // Set offset
                            ),
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                Text(
                                  "Congratulations!.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 21),
                                  ),
                                Text(
                                  "Select your options?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                                    elevation: MaterialStateProperty.all<double>(5),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                                  ),
                                  onPressed:() {
                                    setState(() {
                                      isWin = false;
                                      viewButton.value = false;
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Menu(index: 3,)),
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Play Again",style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                TextButton(
                                  style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                                    elevation: MaterialStateProperty.all<double>(5),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                                  ),
                                  onPressed:() {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Menu(index: 3,)),
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Exit",style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),),
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: viewQuestionNotifier,
              builder: (context, value, child) {
                return Visibility(
                  visible: value,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.1,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(20.0),
                          // Set rounded corners
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54, // Set shadow color
                              blurRadius: 10.0, // Set blur radius
                              offset: Offset(0.0, 10.0), // Set offset
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                list_quesiton[count].question,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 1.7,
                                children: [
                                  getButton(0),
                                  getButton(1),
                                  getButton(2),
                                  getButton(3),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Joystick(
                  // base: Container(
                  //   width: 150,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black38,
                  //     borderRadius: BorderRadius.circular(1000),
                  //   ),
                  // ),
                  stick: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  mode: JoystickMode.horizontalAndVertical,
                  listener: (details) {
                    if (!isUp && !isLeft && !isRight && !isDown) {
                      if (details.x > 0) {
                        isRight = true;
                      } else if (details.x < 0) {
                        isLeft = true;
                      } else if (details.y > 0) {
                        isDown = true;
                      } else if (details.y < 0) {
                        isUp = true;
                      }
                    }
                  },
                ),
              ),
              const SizedBox(width: 25,),
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(20.0),
                  // Set rounded corners
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54, // Set shadow color
                      blurRadius: 10.0, // Set blur radius
                      offset: Offset(0.0, 10.0), // Set offset
                    ),
                  ],
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(20.0), // Add padding
                  child: Column(
                    children: [
                      const Icon(Icons.timer, color: Colors.red,size: 45,),
                      const SizedBox(height: 10,),
                      Text(
                        'Time: ' '$_time',
                        style: const TextStyle(
                            fontSize: 18.0, // Set font size
                            fontWeight: FontWeight.bold, // Set font weight
                            color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getButton(int option) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
          onPressed: () {
            checkResult(option);
            resetStatus(option);
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
            list_quesiton[count].option![option],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }

  void checkResult(int choice) {
    setState(() {
      if (list_quesiton[count].correctAnswer == choice) {
        listColorButton[choice] = Colors.green;
        isCorrect = 1;
      } else {
        listColorButton[choice] = Colors.red;
        isCorrect = 0;
      }
    });
  }

  void resetStatus(int option) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        listColorButton[option] = Colors.white;
        viewQuestionNotifier.value = false;
        count++;
      });
    });
  }
}

class MyWorld extends FlameGame with TapDetector, HasCollisionDetection {
  List<List<int>> typeMap = List.generate(9, (_) => List.generate(8, (_) => 0));

  double distanceMoved = 0;

  @override
  Future<FutureOr<void>> onLoad() async {
     textComponent = TextComponent(
       text: '',
       textRenderer: TextPaint(
         style: const TextStyle(
           fontSize: 52.0,
           color: Colors.greenAccent,
           fontWeight: FontWeight.bold,
         ),
       ),
       anchor: Anchor.topCenter,
       position: Vector2(250, 500.0),
    );
    player = Player();
    player.x = UNIT;
    player.y = UNIT;
    setMap();
    map = List.generate(9, (_) => List.generate(8, (_) => None()));
    for (int i = 0; i < typeMap.length; i++) {
      for (int j = 0; j < typeMap[i].length; j++) {
        if (typeMap[i][j] == 1) {
          map[i][j] = Wall();
        }
        if (typeMap[i][j] == 2) {
          map[i][j] = Treasure();
        }
        if (typeMap[i][j] == 3) {
          map[i][j] = BoxQuestion();
        }
        map[i][j].setPosition((1 + i) * UNIT, (1 + j) * UNIT);
        add(map[i][j]);
      }
    }

    add(player);

  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isCorrect != 2) {
      int i = player.x ~/ UNIT;
      int j = player.y ~/ UNIT;
      if (typeMap[i + 1][j] == 3) {
        i++;
      }
      if (typeMap[i - 1][j] == 3) {
        i--;
      }
      if (typeMap[i][j + 1] == 3) {
        j++;
      }
      if (typeMap[i][j - 1] == 3) {
        j--;
      }
      if (isCorrect == 1) {
        remove(map[i][j]);
        map[i][j] = None();
        map[i][j].setPosition((1 + i) * UNIT, (1 + j) * UNIT);
        typeMap[i][j] = 0;
        add(map[i][j]);
        remove(player);
        add(player);
        isCorrect = 2;
      } else {
        remove(map[i][j]);
        map[i][j] = Wall();
        map[i][j].setPosition((1 + i) * UNIT, (1 + j) * UNIT);
        typeMap[i][j] = 1;
        add(map[i][j]);
        remove(player);
        add(player);

        isCorrect = 2;
      }
    }
    if (isUp) {
      if (distanceMoved == 0) {
        status = checkCollisionTop();
      }
      if ((status == 0 || status ==2)) {
        double distanceToMove =
            1; // Adjust this value to change the speed of the player
        player.y -= distanceToMove;
        distanceMoved += distanceToMove;
        if (distanceMoved == UNIT) {
          isUp = false;
          distanceMoved = 0;
        }
        if(status ==2) {
          add(textComponent);
          isWin = true;
        }
      } else if (status == 3) {
        viewQuestionNotifier.value = true;
        isUp = false;
      } else {
        isUp = false;
      }
    }
    if (isDown) {
      if (distanceMoved == 0) {
        status = checkCollisionDown();
      }
      if ((status == 0)|| status ==2) {
        double distanceToMove =
            1; // Adjust this value to change the speed of the player
        player.y += distanceToMove;
        distanceMoved += distanceToMove;
        if (distanceMoved == UNIT) {
          isDown = false;
          distanceMoved = 0;
        }
        if(status ==2) {
          add(textComponent);
          isWin = true;
        }
      } else if (status == 3) {
        viewQuestionNotifier.value = true;
        isDown = false;
      } else {
        isDown = false;
      }
    }

    if (isLeft) {
      if (distanceMoved == 0) {
        status = checkCollisionLeft();
      }
      if ((status == 0 || status ==2)) {
        double distanceToMove =
            1; // Adjust this value to change the speed of the player
        player.x -= distanceToMove;
        distanceMoved += distanceToMove;
        if (distanceMoved == UNIT) {
          isLeft = false;
          distanceMoved = 0;
        }
        if(status ==2) {
          add(textComponent);
          isWin = true;
        }
      } else if (status == 3) {
        viewQuestionNotifier.value = true;
        isLeft = false;
      } else {
        isLeft = false;
      }
    }
    if (isRight) {
      if (distanceMoved == 0) {
        status = checkCollisionRight();
      }
      if ((status == 0)|| status ==2) {
        double distanceToMove =
            1; // Adjust this value to change the speed of the player
        player.x += distanceToMove;
        distanceMoved += distanceToMove;
        if (distanceMoved == UNIT) {
          isRight = false;
          distanceMoved = 0;
        }
        if(status ==2) {
          add(textComponent);
          isWin = true;
        }
      } else if (status == 3) {
        viewQuestionNotifier.value = true;
        isRight = false;
      } else {
        isRight = false;
      }
    }
    if(isWin) {
      if(textComponent.y>100) {
        textComponent.y = textComponent.y -4;
      }
      else if(textComponent.y==100){
        viewButton.value = true;
      }

    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = Colors.orange.shade100, // Set the color here
    );
    super.render(canvas);
  }

  void setMap() {
    typeMap = [
      [1, 1, 1, 1, 1, 1, 1, 1],
      [1, 0, 0, 3, 0, 1, 0, 1],
      [1, 0, 0, 1, 0, 3, 0, 1],
      [1, 0, 3, 0, 0, 1, 0, 1],
      [1, 1, 0, 1, 0, 1, 0, 1],
      [1, 0, 0, 1, 0, 3, 0, 1],
      [1, 0, 1, 1, 0, 1, 3, 1],
      [1, 0, 1, 0, 3, 0, 2, 1],
      [1, 1, 1, 1, 1, 1, 1, 1],
    ];
  }

  int checkCollisionLeft() {
    return (typeMap[(player.x - 1) ~/ UNIT][(player.y + UNIT / 2) ~/ UNIT]);
  }

  int checkCollisionRight() {
    return (typeMap[(player.x + UNIT + 1) ~/ UNIT]
        [(player.y + UNIT / 2) ~/ UNIT]);
  }

  int checkCollisionTop() {
    return (typeMap[(player.x + UNIT / 2) ~/ UNIT][(player.y - 1) ~/ UNIT]);
  }

  int checkCollisionDown() {
    return (typeMap[(player.x + UNIT / 2) ~/ UNIT]
        [(player.y + UNIT + 1) ~/ UNIT]);
  }
}
