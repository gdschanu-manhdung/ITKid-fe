import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:frontend/game/entity/entity.dart';
import 'package:frontend/game/my_game.dart';

class Wall extends Entity with CollisionCallbacks, HasGameRef<MyWorld>{
  late SpriteComponent spriteComponent;

  @override
  Future<void> onLoad() async {
    spriteComponent = SpriteComponent(
      sprite: await gameRef.loadSprite('wall.png'),
      size: Vector2.all(UNIT),

    );

    add(spriteComponent);
    add(RectangleHitbox());
  }
}