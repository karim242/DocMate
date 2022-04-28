import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Blocs/doctor_register/doctorRegisterCubit.dart';
import '../../Blocs/doctor_register/doctorRegisterStates.dart';

import '../../constant.dart';

class SignUpScreenDoctor2 extends StatelessWidget {
  static String doctorId2="SignUpScreenDoctor2";

  const SignUpScreenDoctor2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorRegisterCubit, DoctorRegisterStates>(
        listener: (context, states) {
          print("$states : SignupDoctor2");
        },
        builder: (context, states) {
          var cubit = DoctorRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: blueColor,
            ),
            backgroundColor: blueColor,
            body: Form(
              key: cubit.doctorformkey2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: logoImage(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(84.0),
                                topRight: Radius.circular(84.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 6,
                                  top: MediaQuery.of(context).size.height / 60,
                                  right: MediaQuery.of(context).size.width / 6,
                                ),
                                child: Row(children: [
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        color: blueColor,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ), //Log In
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width / 10),
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: blueColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ), //Sign Up
                                ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  indicatorOff(),
                                  SizedBox(width: MediaQuery.of(context).size.width/20,),
                                  indicatorOn(),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 55,),
                              textFieldForm(
                                secure:false,
                                text: 'E-mail',
                                ontap: () {},
                                controller: cubit.doctorEmailRegisterController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure:true,
                                text: 'Password',
                                ontap: () {},
                                controller: cubit.doctorPasswordRegisterController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 35,),
                              textFieldForm(
                                secure: true,
                                text: 'Confirm Password',
                                ontap: () {},
                                controller: cubit.doctorPasswordConfirmController,
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.16,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height / 8,),

                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height / 20,
                                  top: MediaQuery.of(context).size.height / 100,
                                ),
                                child: defaultBottonTologin(
                                  text: "Sign Up",
                                  Backgroundcolur: blueColor,
                                  textColor: whiteColor,
                                  height: MediaQuery.of(context).size.height / 14,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  onpressed: () {
                                    if (cubit.doctorformkey2.currentState!.validate())
                                    {
                                      cubit.doctorRegister();

                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
