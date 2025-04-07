import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/info.dart';

class Gamecell extends StatelessWidget {
  final Game game;
  const Gamecell(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(game.image, width: 250),
          Column(
            children: [
              Text(game.name, style: TextStyle(fontSize: 16)),
              Text(
                "${game.price} TND",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Informations et Achat",style:TextStyle(color: Colors.red),))
            ],
          ),
          
        ],
      ),
    );
  }
}
