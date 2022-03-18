import 'package:docmate/doctor%20route/loginscreendoctor.dart';
import 'package:docmate/patient route/loginScreen.dart';
import 'package:docmate/selectUser.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SelectUser(),
    routes:
    {
      SelectUser.id: (context) => const SelectUser(),
      LoginScreen.id: (context) => const LoginScreen(),
      DocLoginScreen.id: (context) => const DocLoginScreen(),



    }
    );
  }
}
