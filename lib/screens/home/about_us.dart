import 'package:flutter/material.dart';

// ignore: camel_case_types
class about_us extends StatelessWidget {
  late final String title;
  about_us(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("About Us"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 61, 25, 67),
      ),
      body: new Center(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            "What is a Vision OnWay App? This app is designed by us to keep you fit and healthy. This app can be downloaded on mobile phones quite easily. The aim of this app is to make your lifestyle healthier by show you how to exercise and be healthy, and workout pattern.",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
