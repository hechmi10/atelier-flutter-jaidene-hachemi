import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/bottomNavigationBar.dart';
import 'package:myapp2/forgotPassword.dart';
import 'package:myapp2/g_store.dart';
import 'package:myapp2/game.dart';
import 'package:myapp2/inscription.dart';
import 'package:myapp2/profile.dart';
import 'package:myapp2/user.dart';
import 'package:myapp2/userService.dart';


class SignIn extends StatelessWidget {
  late String email, name,password;
  late User user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static const String routeName = "/";
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: Colors.red[400],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Connexion",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onSaved: (newValue) => email = newValue!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  ).hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                onSaved: (newValue) async{
                  name = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                obscureText: true,
                onSaved: (newValue) async{
                  password = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: (()async{
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Connexion"),
                          content: const Text("Succés du connexion"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, BottomNavBar.routeName,
                                    arguments: User.full(
                                       name,
                                      email,
                                      password,
                                    ));
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                    await UserService().getCurrentUser().then((user) {
                      if (kDebugMode) {
                        print("User name: ${user.name}");
                        print("User email: ${user.email}");
                      }
                    });
                  }
                }),
                child: const Text("Se Connecter"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: const Text("Mot de passe oublié"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Inscription.routeName);
                },
                child: const Text("Inscription"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
