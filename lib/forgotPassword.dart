import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  late String password,newpassword,confirmpassword;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static const String routeName = "/forgotPassword";
  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:Text("Forgot Password", style: TextStyle(fontSize: 16)),
      backgroundColor: Colors.red,
      ),
      body:Form(
        key: formkey,
        child:ListView(
          children:[
            Center(
              child: Text("Reset Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              decoration:InputDecoration(
                labelText: "password",
                hintText: "Password",
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
              obscureText: true,
              onSaved:(newValue)=>
                  password = newValue!,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:InputDecoration(
                labelText: "newpassword",
                hintText: "New Password",
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
              ),
              obscureText: true,
              onSaved:(newValue)=>
                  newpassword = newValue!,
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
              child:Text("Reset"),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  // Perform password reset logic here
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Success"),
                      content: Text("Password reset successfully!"),
                      
                    );
                  });
                }
              },
            )],
          )
          )
          );
  }
}