import 'package:flutter/material.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/gameService.dart';
import 'package:myapp2/inscription.dart';
import 'package:myapp2/signin.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  static const String routeName = "/details";
  late Game game;
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var quantity = 300;

  @override
  Widget build(BuildContext context) {
    widget.game = ModalRoute.of(context)?.settings.arguments as Game;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(widget.game.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            //1 image
            Image.asset(widget.game.image, width: 250),
            //2 description
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
              ),
            ),

            //3 prix
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "${widget.game.price} TND",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //quantity
            Text("Quantity : $quantity"),
            //4 button
            ElevatedButton.icon(
              onPressed: () async{
                setState(() {
                  quantity--;
                });
                await GameService().saveGame(widget.game).then((value)=> 
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Game added"),
                      content: Text("Game added to your basket"),
                    );
                  },
                ));
              },
              icon: Icon(Icons.shopping_basket),

              label: Text("Acheter"),
            ),
            
          ],
        ),
      ),
    );
  }
}
