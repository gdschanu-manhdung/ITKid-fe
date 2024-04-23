import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:frontend/game/component/ViewQuestion.dart';
import 'package:frontend/game/config.dart';
import 'package:frontend/game/entity/box_question.dart';

import '../repository/question.dart';
import 'entity/entity.dart';
import 'entity/none.dart';
import 'entity/player.dart';
import 'entity/treasure.dart';
import 'entity/wall.dart';

ValueNotifier<bool> viewQuestionNotifier = ValueNotifier<bool>(false);
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
  List<Question> list_quesiton = [
    Question(
      question: "The extension part of Python files",
      option: [".py", ".c", ".java", ".python"],
      correctAnswer: 0,
    ),
    Question(
      question: "Who is the most handsome in the group?",
      option: ["Panda", "SpiderMan", "dark armpits", "chill"],
      correctAnswer: 2,
    ),
    Question(
      question: "The extension part of Python files",
      option: [".py", ".c", ".java", ".python"],
      correctAnswer: 0,
    ),
    Question(
      question: "The extension part of Python files",
      option: [".py", ".c", ".java", ".python"],
      correctAnswer: 0,
    ),
    Question(
      question: "The extension part of Python files5",
      option: [".py", ".c", ".java", ".python"],
      correctAnswer: 0,
    ),
  ];
  int count = 0;
  late var game;

  @override
  void initState() {
    game = GameWidget(game: MyWorld());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
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
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors
                              .orangeAccent // Bo góc tròn với bán kính 10.0

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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    // Bán kính bo góc (tính bằng pixel)
                    // Thuộc tính để thêm viền
                    border: Border.all(
                      color: Colors.orange, // Màu viền
                      width: 5.0, // Độ dày viền (tính bằng pixel)
                    ),
                    color: Colors.amberAccent.shade200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getDirection(Icons.arrow_circle_up, 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getDirection(Icons.arrow_circle_left_outlined, 0),
                        const SizedBox(
                          width: 30,
                        ),
                        getDirection(Icons.arrow_circle_right_outlined, 2)
                      ],
                    ),
                    getDirection(Icons.arrow_circle_down, 3),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget getDirection(IconData icon, int type) {
    return GestureDetector(
        onTapDown: (details) {
          if (!isUp && !isLeft && !isRight && !isDown) {
            switch (type) {
              case 0:
                isLeft = true;
                break;
              case 1:
                isUp = true;
                break;
              case 2:
                isRight = true;
                break;
              case 3:
                isDown = true;
                break;
            }
          }
          setState(() {
            // Thay đổi màu sắc khi click chuột xuống
            containerColor[type] = Colors.orange;
          });
        },
        onTapUp: (details) {
          setState(() {
            // Thay đổi màu sắc khi nhả chuột
            containerColor[type] = Colors.black45;
          });
        },
        child: Icon(
          icon,
          size: 50,
          color: containerColor[type],
        ));
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
       text: 'Winner',
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
