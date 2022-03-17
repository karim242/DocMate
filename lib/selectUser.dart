import 'package:docmate/patient route/loginScreen.dart';
import 'package:flutter/material.dart';
import 'constant.dart';


class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);
  static String id = 'SelectUser';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           logoImage(),
            const SizedBox(height: 31.0),
            defaultBottonTologin(
                  text: "Doctor",
                  Backgroundcolur: whiteColor,
                  textColor: blueColor,
                  onpressed:(){}
               ),
            const SizedBox(height: 24.0),
            defaultBottonTologin(
                text: "Patient",
                Backgroundcolur: whiteColor,
                textColor: blueColor,
                onpressed: () {
                  Navigator.pushNamed(context,LoginScreen.id);
                }
            ),
          ],
        ),
      ),
    );
  }
}
