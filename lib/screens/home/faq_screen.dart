import 'package:flutter/material.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: Color.fromARGB(255, 61, 25, 67),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ExpansionTile(
              title: Text('Is this application payment lifetime'),
              textColor: Colors.black,
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Yes,you have to purchase it only once.You can download this application in another device by using the same account credentials which you are using in you current device.')),
              ],
            ),
            const ExpansionTile(
              title: Text('How to transfer data to another device'),
              textColor: Colors.black,
              children: <Widget>[
                ListTile(
                    title: Text(
                        'you can easily transfer data through gmail,drive etc..')),
              ],
            ),
            const ExpansionTile(
              title: Text('How to reach us?'),
              textColor: Colors.black,
              children: <Widget>[
                ListTile(
                    title: Text(
                        'Send us email via "Example@123.com" and call us via "123456789"')),
              ],
            ),
            const ExpansionTile(
              title: Text('How to download our App'),
              textColor: Colors.black,
              children: <Widget>[
                ListTile(
                    title: Text(
                        'You can download our app from playstore by searching "Vision onWay"')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
