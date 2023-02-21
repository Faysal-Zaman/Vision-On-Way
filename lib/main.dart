import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in/controllerBindings.dart';
import 'package:sign_in/screens/root.dart';

Future<void> main() async {
  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // bind our app with the Getx Controller
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          color: Colors.purple,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.pink),
          toolbarTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ).headline6,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.teal[200],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ).copyWith(
          secondary: Colors.deepPurple,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.teal[200],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: Root(),
    );
  }
}
