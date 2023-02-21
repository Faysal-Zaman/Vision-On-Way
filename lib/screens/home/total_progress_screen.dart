import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sign_in/screens/home/WorkOutTable/workout_screen.dart';

import 'WorkOutTable/fullbody_table.dart';

class TotalProgressScreen extends StatefulWidget {
  const TotalProgressScreen({Key? key}) : super(key: key);

  @override
  State<TotalProgressScreen> createState() => _TotalProgressScreenState();
}

class _TotalProgressScreenState extends State<TotalProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Get.to(() => Workout_Screen());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Image.network(
                                'https://cdn.bhdw.net/im/weight-lifter-muscular-man-bodybuilder-wallpaper-91999_w635.webp',
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    "Full Body Workout",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Get.to(() => Workout_Screen());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Image.network(
                                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-lifestyle-exercising-and-people-concepts-royalty-free-image-1647617548.jpg',
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    "Legs Workout",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
