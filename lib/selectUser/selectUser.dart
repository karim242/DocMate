import 'package:docmate/Blocs/login/login_cubit.dart';
import 'package:docmate/Blocs/login/login_states.dart';
import 'package:docmate/selectUser/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';
import 'loginScreen.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);
  static String id = 'SelectUser';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
            backgroundColor: blueColor,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logoImage(),
                  SizedBox(height: MediaQuery
                      .of(context).size.height / 20),
                  defaultBottonTologin(
                      height: MediaQuery
                          .of(context).size.height / 14,
                      width: MediaQuery
                          .of(context).size.width / 1.4,
                      text: "Doctor",
                      Backgroundcolur: whiteColor,
                      textColor: blueColor,
                      onpressed: () {
                        cubit.changedoctor();
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return LoginScreen(value: "ID",);
                          },),);
                      }
                  ),
                  const SizedBox(height: 24.0),
                  defaultBottonTologin(
                      height: MediaQuery
                          .of(context).size.height / 14,
                      width: MediaQuery
                          .of(context).size.width / 1.4,
                      text: "Patient",
                      Backgroundcolur: whiteColor,
                      textColor: blueColor,
                      onpressed: () {
                        cubit.changepatient();
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return LoginScreen(value: "E-mail",);
                            },),);
                      }
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
