import 'package:docmate/doctor%20route/loginscreendoctor.dart';
import 'package:docmate/patient route/loginScreen.dart';
import 'package:docmate/selectUser.dart';
import 'package:docmate/splashScreen.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'MplUSRounded1c',

    ),



      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    routes:
    {
      SelectUser.id: (context) => const SelectUser(),
      LoginScreen.id: (context) => const LoginScreen(),
      DocLoginScreen.id: (context) => const DocLoginScreen(),



    }
    );
  }
}
