import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Utsav Gupta"),
            accountEmail: Text("oo7coolutsav@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            decoration: BoxDecoration(color: Colors.blue[800]),
          ),
          /*DrawerHeader(
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              decoration: BoxDecoration(color: Colors.black87),
            ),*/
          ListTile(
            leading: Icon(Icons.person, size: 40),
            title: Text(
              "Account",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email, size: 40),
            title: Text(
              "Add Email",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text("user_mail@example.com"),
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 40),
            title: Text(
              "Preferences",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text("Change"),
            trailing: Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
