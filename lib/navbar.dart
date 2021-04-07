import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _currentIndex = 0;
  void onItemTapped(int val){
    setState(() {
      _currentIndex = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded, size: 30), label: "History")
      ],
    );
  }
}
