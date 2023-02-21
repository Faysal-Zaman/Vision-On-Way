import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in/main.dart';
import 'package:sign_in/screens/home/WorkOutTable/fullbody_table.dart';
import 'package:sign_in/screens/home/WorkOutTable/legs_table.dart';

class Workout_Screen extends StatefulWidget {
  const Workout_Screen({Key? key}) : super(key: key);

  @override
  State<Workout_Screen> createState() => _Workout_ScreenState();
}

class _Workout_ScreenState extends State<Workout_Screen> {
  int _selectedIndex = 0;
  TabController? controller;

  // Future<void> _deleteFB() async {
  //   print("Deleting Data...");
  //   print(FirebaseAuth.instance.currentUser!.uid);
  //   try {
  //     var collection = await FirebaseFirestore.instance
  //         .collection('Workout Progress')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('Full Body Workout')
  //         .get();
  //     var snapshot = collection.docs;
  //     for (var i in snapshot) {
  //       await i.reference.delete();
  //     }

  //     Get.snackbar(
  //       "Success",
  //       "Data Deleted Successfully",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //     setState(() {
  //       _hasData = false;
  //     });
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "Something went wrong",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //   }
  // }

  // Future<void> _deleteLG() async {
  //   print("Deleting Data...");
  //   print(FirebaseAuth.instance.currentUser!.uid);
  //   try {
  //     var collection = await FirebaseFirestore.instance
  //         .collection('Workout Progress')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .collection('Legs Workout')
  //         .get();
  //     var snapshot = collection.docs;
  //     for (var i in snapshot) {
  //       await i.reference.delete();
  //     }

  //     Get.snackbar(
  //       "Success",
  //       "Data Deleted Successfully",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "Something went wrong",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //   }
  // }

  @override
  // State<Workout_screen> createState() => _WorkoutState();
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 61, 25, 67),
          title: Text('Workout Progress'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          // remove the back button
          // actions: [
          //   TextButton.icon(
          //     label: Text(
          //       'Delete All',
          //     ),
          //     icon: Icon(Icons.refresh, color: Colors.white),
          //     onPressed: () async {
          //       _selectedIndex == 0 ? await _deleteFB() : await _deleteLG();
          //     },
          //     style: TextButton.styleFrom(
          //         //foregroundColor: Colors.white,
          //         ),
          //   ),
          // ],
          bottom: TabBar(
            padding: EdgeInsets.all(10),
            isScrollable: false,
            automaticIndicatorColorAdjustment: true,
            physics: BouncingScrollPhysics(),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            splashBorderRadius: BorderRadius.circular(50),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            mouseCursor: SystemMouseCursors.click,
            controller: controller,
            indicator: BoxDecoration(
              color: Colors.white,
            ),
            indicatorColor: Color.fromARGB(255, 61, 25, 67),
            indicatorWeight: 5.0,
            unselectedLabelColor: Colors.white,
            labelColor: Color.fromARGB(255, 61, 25, 67),
            tabs: [
              Tab(text: "Full Body Workout"),
              Tab(text: "Legs Workout"),
            ],
            onTap: (value) {
              setState(
                () {
                  _selectedIndex = value;
                  print("Selected Index: " + _selectedIndex.toString());
                },
              );
            },
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            FullBodyTable(),
            LegsTable(),
          ],
        ),
      ),
    );
  }
}
