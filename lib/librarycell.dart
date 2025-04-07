import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';

class Librarycell extends StatelessWidget {
  late Game game;
  Librarycell(this.game,{super.key});

  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(game.image),
        Text(game.name),
        Text("${game.price} TND"),
      ],
    );
  }
}
