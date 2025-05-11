import 'package:flutter/material.dart';
import 'package:myapp2/basket.dart';
import 'package:myapp2/g_store.dart';
import 'package:myapp2/library.dart';
import 'package:myapp2/profile.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "/bottomNavBar";

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [Profile(),GStore(), Library(), Basket()];

  var mcurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[mcurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mcurrentIndex,
        onTap: (index) {
          setState(() {
            mcurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Basket",
          ),
        ],
      ),
    );
  }
}
