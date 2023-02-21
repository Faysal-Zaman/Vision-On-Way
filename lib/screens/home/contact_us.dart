import 'package:flutter/material.dart';

// ignore: camel_case_types
class contact_us extends StatelessWidget {
  late final String title;
  contact_us(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 61, 25, 67),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/VisionOnway-NewLogo.png'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              const Text(
                'Contact Us',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Send us email via \"Example@123.com\"\nand call us via \"123456789\"",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
