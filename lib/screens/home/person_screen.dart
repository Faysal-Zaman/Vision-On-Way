import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sign_in/controller/auth_controller.dart';
import 'package:sign_in/screens/home/about_us.dart';
import 'package:sign_in/screens/home/contact_us.dart';
import 'package:sign_in/screens/home/diet_screen.dart';
import 'package:sign_in/screens/home/setting.dart';
import 'package:sign_in/screens/home/walking.dart';
import 'package:sign_in/screens/home/BMI_Calculator.dart';

import 'WorkOutTable/workout.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vision OnWay',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Color.fromARGB(255, 61, 25, 67),
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(
          color: Colors.pink,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 61, 25, 67),
              ),
              accountName: Text(
                "Vision OnWay",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email!),
            ),
            ListTile(
              title: Text("Settings"),
              trailing: new Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new setting("Settings"),
                  ),
                );
              },
            ),
            Divider(thickness: 3),
            new ListTile(
              title: new Text("Diets"),
              trailing: new Icon(Icons.food_bank_rounded),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DietsScreen(),
                  ),
                );
              },
            ),
            Divider(thickness: 3),
            new ListTile(
              title: new Text("Contact Us"),
              trailing: new Icon(Icons.email_rounded),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new contact_us("Contact Us")));
              },
            ),
            Divider(thickness: 3),
            new ListTile(
              title: new Text("About Us"),
              trailing: new Icon(Icons.people_alt_rounded),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new about_us("About us")));
              },
            ),
            Divider(thickness: 3),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close_fullscreen_rounded),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(thickness: 3),
            SizedBox(height: 20),
            GetBuilder<AuthController>(
              builder: (_authController) {
                return Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    onPressed: () => _authController.signout(),
                    label: Text(
                      "SignOut",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/VisionOnway-NewLogo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_authController.displayName.toString().capitalizeString()}!',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    child: Divider(color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(20, 40),
                        backgroundColor: Color.fromARGB(255, 61, 25, 67),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BmiCalculator()));
                      },
                      child: FittedBox(
                        child: const Text(
                          'Calculate BMI',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(20, 40),
                        backgroundColor: Color.fromARGB(255, 61, 25, 67),
                      ),
                      onPressed: () {
                        _authController.walking();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DietsScreen(),
                        ));
                      },
                      child: FittedBox(
                        child: const Text(
                          '7-Days Diet Plan',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(20, 40),
                        backgroundColor: Color.fromARGB(255, 61, 25, 67),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Workout()));
                      },
                      child: FittedBox(
                        child: const Text(
                          'Workout',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
