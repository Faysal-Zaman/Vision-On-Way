import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/main.dart';

class FullBodyTable extends StatefulWidget {
  const FullBodyTable({Key? key}) : super(key: key);

  @override
  State<FullBodyTable> createState() => _FullBodyTableState();
}

class _FullBodyTableState extends State<FullBodyTable> {
  final Stream<QuerySnapshot> fb = FirebaseFirestore.instance
      .collection('Workout Progress')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('Full Body Workout')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    try {
      return StreamBuilder<QuerySnapshot>(
        stream: fb,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            List<QueryDocumentSnapshot> snapData = data!.docs;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Full Body Workout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.teal[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Days",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Calories',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              'TimeDuration',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapData.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                snapData[i]['Day'] ?? 'No Data',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                snapData[i]['calories'] ?? 'No Data',
                                style: TextStyle(
                                    fontFamily: 'Popins', fontSize: 15),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                snapData[i]['timeDuration'] ?? 'No Data',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.pink[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Total\nProgress",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${snapData.last["totalCalories"]} calories",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          snapData.last["total time"] ?? '0',
                          style: TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No Data'),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 61, 25, 67),
            ),
          );
        },
      );
    } catch (error) {
      return Container(
        child: Text('Something went wrong....'),
      );
    }
  }
}
