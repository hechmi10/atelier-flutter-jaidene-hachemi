import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Image.asset("lib/assets/minecraft.jpg"),
          TextField(decoration: InputDecoration(labelText: "Username"),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          TextField(decoration:InputDecoration(labelText: "Email"),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          TextField(decoration:InputDecoration(labelText: "Mot de passe"),
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          TextField(decoration:InputDecoration(labelText: "Confirmer le mot de passe"),
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          TextField(decoration: InputDecoration(labelText: "Année de naissance"),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          TextField(decoration:InputDecoration(labelText:"Année de facturation"),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: null, child: Text("S'inscrire")),
              ElevatedButton(onPressed: null, child: Text("Annuler")),
            ],
          ),
        ],
      ),
    );
  }
}
