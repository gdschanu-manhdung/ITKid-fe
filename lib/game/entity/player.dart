import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:frontend/game/entity/box_question.dart';
import 'package:frontend/game/entity/entity.dart';
import 'package:frontend/game/entity/wall.dart';
import 'package:frontend/game/my_game.dart';

class Player extends Entity with CollisionCallbacks, HasGameRef<MyWorld>{
  late SpriteComponent spriteComponent;
  bool viewQuestion = false;

  @override
  Future<void> onLoad() async {
    spriteComponent = SpriteComponent(
      sprite: await gameRef.loadSprite('player.png'),
      size: Vector2.all(UNIT),
      position: Vector2(1 * UNIT, UNIT),
      // replace UNIT with your desired position
// replace 100 with your desired size
    );

    add(spriteComponent);
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
      )

  {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Wall ) {
      position = oldPosition;
      print(x/UNIT);
      print(y/UNIT);
    };
    if(other is BoxQuestion ) {
      viewQuestion = true;
      print("aaa");
    }



  }


}