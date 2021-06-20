import 'package:bmi_tracker/drawer.dart';
import 'package:bmi_tracker/homepage.dart';
// import 'package:bmi_tracker/navbar.dart';
import 'package:flutter/material.dart';
import 'package:bmi_tracker/historyPage.dart';

void main() {
  runApp(MaterialApp(
    title: "BMI Tracker & Calculator",
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  final List<Widget> _screens = [HomePage(),History()];
  void onItemTapped(int val){
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Tracker App (Alpha)"),
        backgroundColor: Colors.blue[800],
      ),
      drawer: MyDrawer(),
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded, size: 30), label: "History")
        ],
      ),
    );
  }
}
