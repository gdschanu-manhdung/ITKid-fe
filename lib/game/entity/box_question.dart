import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:frontend/game/config.dart';
import 'package:frontend/game/entity/entity.dart';
import 'package:frontend/game/my_game.dart';

class BoxQuestion extends Entity with CollisionCallbacks, HasGameRef<MyWorld> {
  late SpriteComponent spriteComponent;

  @override
  Future<void> onLoad() async {
    spriteComponent = SpriteComponent(
      sprite: await gameRef.loadSprite('question.png'),
      size: Vector2.all(GameUnit.UNIT),

    );

    add(spriteComponent);
    add(RectangleHitbox());
  }
}