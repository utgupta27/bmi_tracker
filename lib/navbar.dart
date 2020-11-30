import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded, size: 30), label: "History")
      ],
    );
  }
}
