import 'package:flutter/material.dart';

import '../reset_password/reset_password.dart';

// ignore: camel_case_types
class setting extends StatelessWidget {
  late final String title;
  setting(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 61, 25, 67),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Card(
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => ResetPassword(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Color.fromARGB(255, 61, 25, 67),
                      ),
                      title: Text("Reset Password"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Notification Settings",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color.fromARGB(255, 61, 25, 67),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  dense: true,
                  activeColor: Color.fromARGB(255, 61, 25, 67),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received Notification"),
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Color.fromARGB(255, 61, 25, 67),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received NewsLetter"),
                  onChanged: null,
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Color.fromARGB(255, 61, 25, 67),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received Offer Notification"),
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Color.fromARGB(255, 61, 25, 67),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Received App Updates"),
                  onChanged: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
