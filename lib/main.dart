import 'package:bmi_tracker/drawer.dart';
import 'package:bmi_tracker/homepage.dart';
import 'package:bmi_tracker/navbar.dart';
import 'package:flutter/material.dart';
import 'package:bmi_tracker/func.dart';

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

int inputHeight, inputWeight, inputAge;
var outBMI, suggest;
final heightController = TextEditingController();
final weightController = TextEditingController();
final ageController = TextEditingController();

class MainPageState extends State<MainPage> {
  void update(double value) {
    outBMI = value.toStringAsPrecision(2);
  }

  void updateSuggestion(var sug) {
    suggest = sug;
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Tracker App (Alpha)"),
        backgroundColor: Colors.blue[800],
      ),
      drawer: MyDrawer(),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          inputHeight = int.parse(heightController.value.text);
          inputWeight = int.parse(weightController.value.text);
          inputAge = int.parse(ageController.value.text);
          setState(() {
            super.setState(() {
              update(calculate(inputHeight, inputWeight));
              updateSuggestion(suggestion(outBMI));
            });
          });
        },
        child: Icon(Icons.calculate_outlined),
        backgroundColor: Colors.black54,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: MyNavBar(),
    );
  }
}
