import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/gameService.dart';
import 'package:myapp2/librarycell.dart';

// ignore: must_be_immutable
class Library extends StatelessWidget{
  static const String routeName = "/library";
  var games = [
    Librarycell(Game("lib/assets/dmc5.jpg", "DMC", 200)),
    Librarycell(Game("lib/assets/fifa.jpg", "FIFA", 200)),
    Librarycell(Game("lib/assets/minecraft.jpg", "Mine craft", 300)),
  ];

  Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bibliothèque", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.red,
      ),
      body:FutureBuilder(future:GameService().getGames(),builder: (context, snapshot) {
        return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
      , itemBuilder: (context, index) {
        return Librarycell(snapshot.data![index]);
      }, itemCount: snapshot.data!.length);
      },)
        
      
    );
  }
}