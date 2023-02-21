import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/screens/home/WorkOutTable/fullbody_table.dart';
import 'package:sign_in/screens/home/faq_screen.dart';
import 'package:sign_in/screens/home/person_screen.dart';
import 'package:sign_in/screens/home/total_progress_screen.dart';

import 'WorkOutTable/workout_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> storeUserData() async {
    final addFullBody = FirebaseFirestore.instance
        .collection("Workout Progress")
        .doc("${FirebaseAuth.instance.currentUser!.uid.toString()}")
        .collection("Full Body Workout")
        .doc("Day 0");

    final addLegs = FirebaseFirestore.instance
        .collection("Workout Progress")
        .doc("${FirebaseAuth.instance.currentUser!.uid.toString()}")
        .collection("Legs Workout")
        .doc("Day 0");

    final data = {
      "Day": "Day 0",
      "calories": "0 calories",
      "timeDuration": "0 minutes",
      "totalCalories": "0 calories",
      "total time": "0 minutes"
    };

    await addFullBody.set(data);
    await addLegs.set(data);
  }

  @override
  void initState() {
    super.initState();
    storeUserData().then((value) => print("User Data Stored"));
  }

  // ignore: non_constant_identifier_names
  int _SelectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PersonScreen(),
    TotalProgressScreen(),
    FAQs(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_SelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        selectedItemColor: Color.fromARGB(255, 61, 25, 67),
        unselectedItemColor: Colors.pink,
        backgroundColor: Colors.white,
        selectedFontSize: 17,
        unselectedFontSize: 15,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 25),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph_outlined),
              label: 'Progress',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_sharp),
              label: 'FAQs',
              backgroundColor: Colors.blue),
        ],
        currentIndex: _SelectedIndex,
        onTap: _onItemTap,
        elevation: 20,
      ),
    );
  }
}
