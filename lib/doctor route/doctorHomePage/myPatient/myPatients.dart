import 'package:flutter/material.dart';
import '../../../constant.dart';

class MyPatientsPage extends StatelessWidget {
  const MyPatientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Patients",
          style: textTitle22Style,
        ),
      ),
    );
  }
}
