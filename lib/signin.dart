import 'package:flutter/material.dart';
import 'package:myapp2/forgotPassword.dart';
import 'package:myapp2/game.dart';

class SignIn extends StatelessWidget {
  late String email, password;
  late Game game;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static const String routeName = "/signin";
  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    game = ModalRoute.of(context)?.settings.arguments as Game;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        backgroundColor: Colors.red[400],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Image.asset(game.image,width: 250,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Sign In",
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
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
                obscureText: true,
                onSaved: (newValue) => password = newValue!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: (() {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushNamed(context, '/home');
                  }
                }),
                child: const Text("Sign In"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: const Text("Forgot Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
