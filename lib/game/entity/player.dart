import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:frontend/game/config.dart';

import 'package:frontend/game/entity/entity.dart';

import 'package:frontend/game/my_game.dart';

class Player extends Entity with CollisionCallbacks, HasGameRef<MyWorld>{
  late SpriteComponent spriteComponent;


  @override
  Future<void> onLoad() async {
    spriteComponent = SpriteComponent(
      sprite: await gameRef.loadSprite('player.png'),
      size: Vector2.all(UNIT),
      position: Vector2( UNIT, UNIT),

    );

    add(spriteComponent);
    add(RectangleHitbox());
  }

  // @override
  // void onCollisionStart(
  //     Set<Vector2> intersectionPoints,
  //     PositionComponent other,
  //     )
  //
  // {
  //   super.onCollisionStart(intersectionPoints, other);
  //   if(other is Wall ) {
  //     position = oldPosition;
  //     print(x/UNIT);
  //     print(y/UNIT);
  //   };
  //   if(other is BoxQuestion ) {
  //     viewQuestion = true;
  //     print("aaa");
  //   }
  //
  //
  //
  // }


}