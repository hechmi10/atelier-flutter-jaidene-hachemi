import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/gamecell.dart';

class GStore extends StatelessWidget {
  const GStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("G Store Esprit"),
      ),
      body: Column(
        children: [
          Gamecell(Game("lib/assets/dmc5.jpg", "DMC", 200)),
          Gamecell(Game("lib/assets/fifa.jpg", "FIFA", 200)),
          Gamecell(Game("lib/assets/minecraft.jpg", "Mine craft", 300)),
        ],
      ),
    );
  }
}
