import 'package:flutter/material.dart';

import 'game.dart';

class Info extends StatelessWidget {
  late Game game;

  var quantity = 100;

  Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devil May Cry 5"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("lib/assets/dmc5.jpg"),
          Text(
            "Devil May Cry is a game developed by Capcom",
            style: TextStyle(fontSize: 16),
          ),
          Text("100 TND", style: TextStyle(fontSize: 36)),
          Text(
            "Exemplaires Disponibles:$quantity",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {
              quantity--;
            },
            child: Text("Acheter"),
          ),
        ],
      ),
    );
  }
}
