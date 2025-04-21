import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';

// ignore: must_be_immutable
class Gamecell extends StatelessWidget {
  late Game game;
  Gamecell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
        Navigator.pushNamed(
          context,
          '/details',
          arguments: game,
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(game.image, width: 200),
            Column(
              children: [
                Text(game.name, style: TextStyle(fontSize: 16)),
                Text(
                  "${game.price} TND",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
