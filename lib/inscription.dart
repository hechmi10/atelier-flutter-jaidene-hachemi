import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp2/CustomInputDecoration.dart';
import 'package:myapp2/game.dart';

// ignore: must_be_immutable
class Inscription extends StatelessWidget {
  static const String routeName = "/signup";
  late Game game;
  late String username,email,password,confirmPassword,dateNaissance,dateFacturation;
  GlobalKey<FormState> currentKey = GlobalKey<FormState>();
  Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    game = ModalRoute.of(context)?.settings.arguments as Game;
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.red,
      ),
      body:Padding(padding:EdgeInsets.symmetric(vertical: 20),
      child:Form(
        key: currentKey,
        child: ListView(
          children: [
            Image.asset(game.image, width: 250),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Inscription",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                "Username",
                "Username",
                Icons.person_outline_outlined,
              ).customInputDecoration(),
              onSaved:(newValue)=>
                  username = newValue!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username required';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                "Email",
                "Email",
                Icons.email_outlined,
              ).customInputDecoration(),
              onSaved:(newValue)=>
                  email = newValue!,
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Email required' : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                'Password', 'Password', Icons.lock_outline,
              ).customInputDecoration(),
              obscureText: true,
              onSaved:(newValue)=>
                  password = newValue!,
              validator:
                  (value) =>
                      value!.length < 8
                          ? 'Password must be more than 8 characters'
                          : null,

              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                'Confirm Password', 'Confirm Password', Icons.lock_outline,
              ).customInputDecoration(),
              obscureText: true,
              onSaved:(newValue)=>
                  confirmPassword = newValue!,
              validator:
                  (value) =>
                      value!.length < 8
                          ? 'Password must be more than 8 characters'
                          : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                'Date de naissance','Date de naissance' ,Icons.calendar_today,
              ).customInputDecoration(),
              onSaved:(newValue)=>
                  dateNaissance = newValue!,
              validator:
                  (value) =>
                      value!.length < 4
                          ? 'Year must be more than 4 characters'
                          : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            TextFormField(
              decoration: CustomInputDecoration(
                'Date de facturation','Date de facturation' ,Icons.calendar_today,
              ).customInputDecoration(),
              onSaved:(newValue)=>
                  dateFacturation = newValue!,
              validator:
                  (value) =>
                      value!.length < 4
                          ? 'Year must be more than 4 characters'
                          : null,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                 onPressed: () {
                      if (currentKey.currentState!.validate()) {
                        currentKey.currentState!.save();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return (AlertDialog(
                              title: Text("Sign up"),
                              content: Text("user Added"),
                            ));
                          },
                        );
                      }
                    },
                  child: Text("S'inscrire"),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Annuler")),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}
