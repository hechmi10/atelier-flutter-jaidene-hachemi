import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/gameService.dart';
import 'package:myapp2/gamecell.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Game>>(
        future: GameService().getAllGames(),
        builder: (context, snapshot) {
          // Show loading indicator while waiting for data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message if something went wrong
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Handle case where data is null or empty
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No games available'));
          }

          // Data is available, build the list
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Gamecell(snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}