import 'package:flutter/material.dart';
import 'package:myapp2/user.dart';

class Profile extends StatelessWidget {
  static const String routeName = "/profile"; // Nom de la route pour accéder à cette page
  late User user; // Déclaration de la variable user
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    user=ModalRoute.of(context)!.settings.arguments as User; // Récupérer l'utilisateur passé en argument
    return Scaffold(
      appBar:AppBar(
        title: Text("Mon profile"),
        backgroundColor: Colors.red[400],
        ),
        body:Center(child:Text("${user.name} ${user.email}")),  );
  }
}