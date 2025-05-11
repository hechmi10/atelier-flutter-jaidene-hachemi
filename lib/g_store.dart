import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/gameService.dart';
import 'package:myapp2/gamecell.dart';

// ignore: must_be_immutable
class GStore extends StatelessWidget {
  static const String routeName = "/store";
  var games = [
    Gamecell(Game("lib/assets/dmc5.jpg", "DMC", 200)),
    Gamecell(Game("lib/assets/fifa.jpg", "FIFA", 200)),
    Gamecell(Game("lib/assets/minecraft.jpg", "Mine craft", 300)),
  ];
  GStore({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("G Store Esprit"),
      ),
      body:FutureBuilder(
        future: GameService().getGames()
        , builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text("Error"),);
          }
          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("No games available"),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Gamecell(snapshot.data![index]);
            },
          );
        },
      ),
       /*ListView.builder(
          itemCount:games.length,
          itemBuilder: (context, index) {
            return games[index];
          }),*/
    );
  }
}
