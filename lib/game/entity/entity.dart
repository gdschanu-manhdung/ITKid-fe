import 'package:flame/components.dart';

import '../config.dart';

abstract class Entity extends PositionComponent {
  Entity() {
    // anchor = Anchor.center;
    size = Vector2(GameUnit.UNIT, GameUnit.UNIT);
  }

  void setPosition(double x, double y) {
    this.x = x;
    this.y = y;
  }
}