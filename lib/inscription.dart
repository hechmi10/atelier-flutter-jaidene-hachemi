import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp2/game.dart';

class Inscription extends StatefulWidget {
  late Game game;
  Inscription(this.game,{super.key});

  @override
  State<StatefulWidget> createState() => _InscriptionState();
}
class _InscriptionState extends State<Inscription>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Image.asset(widget.game.image, width: 250),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Inscription",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Username"),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          TextField(
            decoration: InputDecoration(labelText: "Email"),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          TextField(
            decoration: InputDecoration(labelText: "Mot de passe"),
            obscureText: true,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          TextField(
            decoration: InputDecoration(labelText: "Confirmer le mot de passe"),
            obscureText: true,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          TextField(
            decoration: InputDecoration(labelText: "Année de naissance"),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          TextField(
            decoration: InputDecoration(labelText: "Année de facturation"),
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("S'inscrire")),
              ElevatedButton(onPressed: () {}, child: Text("Annuler")),
            ],
          ),
        ],
      ),
    );
  }
}
