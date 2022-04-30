import 'dart:async';
import 'package:docmate/constant.dart';
import 'package:docmate/selectUser/selectUser.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4,), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SelectUser();
      }));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: logoImage(),
      ),
    );
  }
}
