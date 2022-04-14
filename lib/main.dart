import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      game: MySpriteTutorial(),
    ),
  );
}

class MySpriteTutorial extends FlameGame {
  late SpriteAnimationComponent girlWalking;
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    final spriteSheet =
        await fromJSONAtlas('spritesheet.png', 'spritesheet.json');
    SpriteAnimation walk = SpriteAnimation.spriteList(
      spriteSheet,
      stepTime: 0.03,
    );

    SpriteComponent background = SpriteComponent()..sprite = await loadSprite('background.jpg')
    ..size= size
    ..position = Vector2(0, 0);

    add(background);

    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(80, 10)
      ..size = Vector2(200, 200);
    add(girlWalking);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (girlWalking.x < size[0] - 200) {
      girlWalking.x += dt * 100;
    }

    if (girlWalking.y < size[1] - 200) {
      girlWalking.y += dt * 80;
    }
  }
}
