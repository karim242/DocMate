import 'package:docmate/doctor%20route/loginscreendoctor.dart';
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
            SizedBox(height:MediaQuery.of(context).size.height/20),
            defaultBottonTologin(
                height : MediaQuery.of(context).size.height/14,
                width : MediaQuery.of(context).size.width/1.4,
                  text: "Doctor",
                  Backgroundcolur: whiteColor,
                  textColor: blueColor,
                  onpressed:(){
                    Navigator.pushNamed(context, DocLoginScreen.id);
                  }
               ),
            const SizedBox(height: 24.0),
            defaultBottonTologin(
                height : MediaQuery.of(context).size.height/14,
                width : MediaQuery.of(context).size.width/1.4,
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
