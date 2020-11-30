import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: "BMI Tracker & Calculator",
    home: HomePage(),
  ));
}

var col = '';
double calculate(var height, var weight) {
  return (weight / pow(height, 2)) * 10000;
}

String suggestion(var value) {
  double a = double.parse(value);
  var str;
  if (a < 18.5) {
    str = 'Underweight';
    col = 'red';
  } else {
    if (18.5 < a && a < 24.9) {
      str = 'Normal Weight';
      col = 'green';
    } else {
      if (25 < a && a < 29.9) {
        str = 'Over Weight';
        col = 'orange';
      } else {
        if (30 < a) {
          str = 'Obesity';
          col = 'red';
        }
      }
    }
  }
  return str;
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int inputHeight, inputWeight, inputAge;
  var outBMI, suggest;
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();
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
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text("Utsav Gupta"),
      //         accountEmail: Text("oo7coolutsav@gmail.com"),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage: AssetImage('assets/profile.png'),
      //         ),
      //         decoration: BoxDecoration(color: Colors.black87),
      //       ),
      //       /*DrawerHeader(
      //         child: Center(
      //           child: Text(
      //             "Settings",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 40),
      //           ),
      //         ),
      //         decoration: BoxDecoration(color: Colors.black87),
      //       ),*/
      //       ListTile(
      //         leading: Icon(Icons.person, size: 40),
      //         title: Text(
      //           "Account",
      //           style: TextStyle(fontSize: 18),
      //         ),
      //         subtitle: Text("Personal"),
      //         trailing: Icon(Icons.edit),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.email, size: 40),
      //         title: Text(
      //           "Add Email",
      //           style: TextStyle(fontSize: 18),
      //         ),
      //         subtitle: Text("user_mail@example.com"),
      //         trailing: Icon(Icons.add),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings, size: 40),
      //         title: Text(
      //           "Preferences",
      //           style: TextStyle(fontSize: 18),
      //         ),
      //         subtitle: Text("Change"),
      //         trailing: Icon(Icons.edit),
      //       )
      //     ],
      //   ),
      // ),
      body: ListView(
        children: <Widget>[
          //The Top Banner of the Body containing a .webp image and some text
          Padding(
            padding: const EdgeInsets.all(0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.height,
                height: 180,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Easily monitor\nyour Health",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue[600], Colors.white]),
                  borderRadius: BorderRadius.circular(0),
                  image: const DecorationImage(
                    alignment: Alignment.centerRight,
                    image: AssetImage('assets/img1.webp'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: MediaQuery.of(context).size.height,
              height: 470,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Enter Your Details",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 80, 1),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      controller: heightController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        icon: Icon(Icons.accessibility, size: 40),
                        labelText: "Enter Your Height (Cms)",
                        labelStyle: TextStyle(
                            // color: Colors.red,
                            ),
                        hintText: 'e.g, 152',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 80, 1),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      controller: weightController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        icon: Icon(Icons.airline_seat_flat_rounded, size: 40),
                        labelText: "Enter Your Weight (Kg)",
                        hintText: 'e.g, 47',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 80, 1),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      textInputAction: TextInputAction.done,
                      controller: ageController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        focusColor: Colors.black87,
                        icon: Icon(Icons.perm_contact_calendar_outlined,
                            size: 40),
                        labelText: "Enter Your Age",
                        hintText: 'e.g, 26',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.analytics_outlined, size: 40),
                          tileColor: Colors.grey[350],
                          title: Text(
                            "Your BMI is :       $outBMI",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: ListTile(
                        // leading: Icon(Icons.analytics_outlined, size: 40),
                        tileColor: Colors.grey[350],
                        title: Center(
                          child: Text(
                            "$suggest",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10), color: Colors.grey, blurRadius: 15)
                ],
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.height,
                height: 230,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "BMI Categories -",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "\nUnderweight = <18.5 \nNormal weight = 18.5–24.9 \nOverweight = 25–29.9 \nObesity = BMI of 30 or greater",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        color: Colors.grey,
                        blurRadius: 15)
                  ],
                  //
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.blue[600]]),
                  borderRadius: BorderRadius.circular(0),
                  /*image: const DecorationImage(
                    alignment: Alignment.centerRight,
                    image: NetworkImage(
                        "https://cdn0.iconfinder.com/data/icons/health-checkups-3/64/Bmi-measure-scale-weight-512.png"),
                    fit: BoxFit.contain,
                  ),*/
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          inputHeight = int.parse(heightController.value.text);
          inputWeight = int.parse(weightController.value.text);
          inputAge = int.parse(ageController.value.text);
          setState(() {
            update(calculate(inputHeight, inputWeight));
            updateSuggestion(suggestion(outBMI));
          });
        },
        child: Icon(Icons.calculate_outlined),
        backgroundColor: Colors.black54,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
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
