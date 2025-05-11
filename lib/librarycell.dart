import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';

// ignore: must_be_immutable
class Librarycell extends StatelessWidget {
  late Game game;
  Librarycell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: game);
      },
      child: Column(
        children: [
          Image.asset(game.image),
          Text(game.name),
          Text("${game.price} TND"),
        ],
      ),
    );
  }
}
