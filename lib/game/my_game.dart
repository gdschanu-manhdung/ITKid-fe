import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/game/config.dart';
import 'package:frontend/game/entity/box_question.dart';

import 'entity/entity.dart';
import 'entity/none.dart';
import 'entity/player.dart';
import 'entity/treasure.dart';
import 'entity/wall.dart';



const double UNIT = GameUnit.UNIT;
bool viewQuestion = false;
late Player player;
bool isUp = false;
bool isDown = false;
bool isLeft = false;
bool isRight = false;
late Vector2 oldPosition;
class MyGame extends StatefulWidget {
  const MyGame({super.key});

  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SizedBox(height: 100,),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Treasure Game',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.orange),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: double.infinity, height: 300, child: GameWidget(game: MyWorld())
            ),
            Visibility(
              visible: viewQuestion, // Hiện container khi check = true
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    width: 300,
                    height: 100,
                  ),
                  TextButton(
                      onPressed: () {
                  setState(() {
                    viewQuestion = false;
                  });
                  }, child: const Text('Close', style: TextStyle(color: Colors.white),))
                ],
              ),
            ),
    ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0), // Bán kính bo góc (tính bằng pixel)
                  // Thuộc tính để thêm viền
                  border: Border.all(
                    color: Colors.orange, // Màu viền
                    width: 5.0, // Độ dày viền (tính bằng pixel)
                  ),
                  color: Colors.amberAccent.shade200
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          isUp = true;
                        },
                        child: const Icon(
                          Icons.arrow_circle_up,
                          size: 50,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        GestureDetector(
                            onTap: () {
                              isLeft = true;
                            },
                            child: const Icon(
                              Icons.arrow_circle_left_outlined,
                              size: 50,
                            )),
                        const SizedBox(width: 30,),
                        GestureDetector(
                            onTap: () {
                              isRight = true;
                            },
                            child: const Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 50,
                            )),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          isDown = true;
                        },
                        child: const Icon(
                          Icons.arrow_circle_down,
                          size: 50,
                        )),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}


class MyWorld extends FlameGame with TapDetector, HasCollisionDetection {
  List<List<int>> typeMap = List.generate(9, (_) => List.generate(5, (_) => 0));

  double distanceMoved = 0;

  @override
  Future<FutureOr<void>> onLoad() async {




    player = Player();

    setMap();
    late List<List<Entity>> map =
    List.generate(9, (_) => List.generate(5, (_) => None()));
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 5; j++) {
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
    oldPosition = player.position.clone();
    viewQuestion = player.viewQuestion;
    if (isUp) {
      double distanceToMove =
          50 * dt; // Adjust this value to change the speed of the player
      player.y -= distanceToMove;
      distanceMoved += distanceToMove;
      if (distanceMoved >= UNIT) {
        isUp = false;
        distanceMoved = 0;
      }
    }
    if (isDown) {
      double distanceToMove =
          50 * dt; // Adjust this value to change the speed of the player
      player.y += distanceToMove;
      distanceMoved += distanceToMove;
      if (distanceMoved >= UNIT) {
        isDown = false;
        distanceMoved = 0;
      }
    }
    if (isLeft) {
      double distanceToMove =
          50 * dt; // Adjust this value to change the speed of the player
      player.x -= distanceToMove;
      distanceMoved += distanceToMove;
      if (distanceMoved >= UNIT) {
        isLeft = false;
        distanceMoved = 0;
      }
    }
    if (isRight) {
      double distanceToMove =
          50 * dt; // Adjust this value to change the speed of the player
      player.x += distanceToMove;
      distanceMoved += distanceToMove;
      if (distanceMoved >= UNIT) {
        isRight = false;
        distanceMoved = 0;
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
    typeMap[1][0] = 1;
    typeMap[1][1] = 1;
    typeMap[4][1] = 1;
    typeMap[6][1] = 1;
    typeMap[7][1] = 1;
    typeMap[3][2] = 1;
    typeMap[6][2] = 1;
    typeMap[0][3] = 1;
    typeMap[1][3] = 1;
    typeMap[4][3] = 1;
    typeMap[6][3] = 1;
    typeMap[7][3] = 1;
    typeMap[0][4] = 1;
    typeMap[1][4] = 1;
    typeMap[3][4] = 1;
    typeMap[1][2] = 3;
    typeMap[2][1] = 3;
    typeMap[5][3] = 3;
    typeMap[7][2] = 2; // kho báu
  }
}


